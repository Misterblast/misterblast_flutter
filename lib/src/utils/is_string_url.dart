extension StringUrlExtension on String {
  bool get isUrl {
    final urlPattern =
        r'''^(https?:\/\/)?([\w\-]+\.)+[\w\-]+(\/[\w\-._~:/?#[\]@!$&\'()*+,;=]*)?$''';
    final regExp = RegExp(urlPattern, caseSensitive: false);
    return regExp.hasMatch(this);
  }
}
