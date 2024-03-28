typedef PaginationDebouncerCallback = void Function();

final class PaginationDebouncer {
  int? lastExecutedTimestamp;
  int waitTime;
  PaginationDebouncer({
    required this.waitTime,
  });

  /// Debounces the pagination.
  void debounce(PaginationDebouncerCallback pdc) {
    var now = DateTime.now().millisecondsSinceEpoch;
    if (lastExecutedTimestamp == null) {
      pdc();
      lastExecutedTimestamp = now;
      return;
    }
    var diff = now - lastExecutedTimestamp!;
    if (diff < waitTime) return;
    pdc();
    lastExecutedTimestamp = now;
  }
}
