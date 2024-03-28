import 'package:flutter/widgets.dart';

import '../debouncer/index.dart';

final class PaginationController {
  PaginationDebouncer debouncer;
  final int waitTime;
  final PaginationDebouncerCallback onFetchMore;
  final ScrollController controller;
  final double scrollOffset;

  PaginationController({
    required this.onFetchMore,
    required this.controller,
    required this.waitTime,
    required this.scrollOffset,
  }) : debouncer = PaginationDebouncer(waitTime: waitTime);

  bool handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (controller.position.extentAfter < scrollOffset) {
        debouncer.debounce(() {
          onFetchMore();
        });
      }
    }
    return false;
  }
}
