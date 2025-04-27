import json
import re
from deep_translator import GoogleTranslator
from tqdm import tqdm

version = input("Enter translation version for en (e.g. v1.0, v2-beta): ").strip()
output_file = f"assets/locales/en_{version}.json"

# Load JSON files for Bahasa Indonesia and English
with open("assets/locales/id.json", "r", encoding="utf-8") as id_file:
    id_data = json.load(id_file)

with open("assets/locales/en.json", "r", encoding="utf-8") as en_file:
    en_data = json.load(en_file)

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

# Flatten both JSON files
flat_id_data = flatten_json(id_data)
flat_en_data = flatten_json(en_data)

# Prepare the translated data
translated_data = flat_en_data.copy()  # Start with existing English data

print("Translating missing keys...")

for key in tqdm(flat_id_data, desc="Translating keys", unit="key"):
    if key not in flat_en_data:  # Only translate keys that are missing in en.json
        value = flat_id_data[key]
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