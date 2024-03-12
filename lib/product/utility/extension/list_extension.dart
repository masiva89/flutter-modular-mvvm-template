extension ListExtension on List<dynamic>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
