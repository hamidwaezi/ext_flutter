
extension EnumExtension on Enum {
  String get convertToString =>
      toString().replaceAll('$runtimeType.', '');
}