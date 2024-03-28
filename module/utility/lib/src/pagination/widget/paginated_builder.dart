import 'package:flutter/widgets.dart';

import '../controller/index.dart';
import '../debouncer/index.dart';

class PaginatedBuilder extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    ScrollController controller,
  ) builder;

  final VoidCallback onFetchMore;
  final int debouncerWaitDuration;
  final double scrollOffset;

  const PaginatedBuilder({
    Key? key,
    required this.onFetchMore,
    required this.builder,
    this.debouncerWaitDuration = 3000,
    this.scrollOffset = 20,
  }) : super(key: key);

  @override
  State<PaginatedBuilder> createState() => _PaginatedBuilderState();
}

class _PaginatedBuilderState extends State<PaginatedBuilder> {
  late VoidCallback onFetchMore;
  late int debouncerWaitDuration;
  late double scrollOffset;

  late ScrollController controller;
  late PaginationDebouncer debouncer;
  late PaginationController paginationController;

  @override
  void didUpdateWidget(covariant PaginatedBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.onFetchMore != widget.onFetchMore) {
      onFetchMore = widget.onFetchMore;
    }
    if (oldWidget.debouncerWaitDuration != widget.debouncerWaitDuration) {
      debouncerWaitDuration = widget.debouncerWaitDuration;
    }
    if (oldWidget.scrollOffset != widget.scrollOffset) {
      scrollOffset = widget.scrollOffset;
    }

    paginationController = PaginationController(
      onFetchMore: onFetchMore,
      waitTime: debouncerWaitDuration,
      controller: controller,
      scrollOffset: scrollOffset,
    );
  }

  @override
  void initState() {
    super.initState();

    controller = ScrollController();

    onFetchMore = widget.onFetchMore;
    debouncerWaitDuration = widget.debouncerWaitDuration;
    scrollOffset = widget.scrollOffset;

    paginationController = PaginationController(
      onFetchMore: onFetchMore,
      waitTime: debouncerWaitDuration,
      controller: controller,
      scrollOffset: scrollOffset,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: paginationController.handleScrollNotification,
      child: widget.builder(context, controller),
    );
  }
}
