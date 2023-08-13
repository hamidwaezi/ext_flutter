
extension ListExtension on List? {
  bool get isNullOrBlank {
    if (this == null) return true;

    return _hasIsEmpty(this) ? this!.isEmpty  : false;
  }
  bool _hasIsEmpty(dynamic value) {
    return value is Iterable || value is String || value is Map;
  }
}