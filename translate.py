import json
import re
from deep_translator import GoogleTranslator
from tqdm import tqdm

version = input("Enter translation version for en (e.g. v1.0, v2-beta): ").strip()
output_file = f"assets/locales/en_{version}.json"

# Load file JSON Bahasa Indonesia
with open("assets/locales/id.json", "r", encoding="utf-8") as file:
    id_data = json.load(file)

translator = GoogleTranslator(source='id', target='en')

def flatten_json(data, parent_key='', sep='.'):
    items = {}
    for k, v in data.items():
        new_key = f"{parent_key}{sep}{k}" if parent_key else k
        if isinstance(v, dict):
            items.update(flatten_json(v, new_key, sep=sep))
        else:
            items[new_key] = v
    return items

def unflatten_json(flat_data, sep='.'):
    result_dict = {}
    for k, v in flat_data.items():
        keys = k.split(sep)
        d = result_dict
        for part in keys[:-1]:
            d = d.setdefault(part, {})
        d[keys[-1]] = v
    return result_dict

def translate_text(text):
    # Handle placeholders like {name}
    placeholders = re.findall(r"\{.*?\}", text)
    placeholder_map = {f"__PLACEHOLDER_{i}__": ph for i, ph in enumerate(placeholders)}
    temp_text = text
    for ph_text, ph in placeholder_map.items():
        temp_text = temp_text.replace(ph, ph_text)
    translated = translator.translate(temp_text)
    for ph_text, ph in placeholder_map.items():
        translated = translated.replace(ph_text, ph)
    return translated

# Flatten the nested JSON to a dict with key paths
flat_data = flatten_json(id_data)
translated_data = {}

print("Translating...")

for key in tqdm(flat_data, desc="Translating keys", unit="key"):
    value = flat_data[key]
    if isinstance(value, str):
        translated_data[key] = translate_text(value)
    else:
        translated_data[key] = value

# Rebuild the nested structure
final_translated = unflatten_json(translated_data)

# Save to new file
with open(output_file, "w", encoding="utf-8") as f:
    json.dump(final_translated, f, ensure_ascii=False, indent=2)

print("✅ Translation complete! Saved to " + output_file)
