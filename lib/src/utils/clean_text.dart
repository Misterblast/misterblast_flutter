String cleanText(String raw) {
  return raw
      .replaceAll(RegExp(r'&#xA;'), '')
      .replaceAll(RegExp(r'\t+'), ' ')
      .replaceAll(RegExp(r' +'), ' ')
      .trim();
}
