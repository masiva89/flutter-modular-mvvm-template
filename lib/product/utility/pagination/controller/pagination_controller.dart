import 'package:flutter/widgets.dart';

import '../pagination.dart';

final class PaginationController {
  PaginationDebouncer debouncer;
  int? lastExecutedTimestamp;
  final int waitTime;
  final PaginationDebouncerCallback onFetchMore;
  final ScrollController controller;

  PaginationController({
    required this.onFetchMore,
    required this.controller,
    required this.waitTime,
  }) : debouncer = PaginationDebouncer(waitTime: waitTime);

  bool handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (controller.position.extentAfter == 0) {
        debouncer.debounce(() {
          onFetchMore();
        });
      }
    }
    return false;
  }
}
