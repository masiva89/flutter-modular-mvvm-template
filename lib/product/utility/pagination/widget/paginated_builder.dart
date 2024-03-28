import 'package:flutter/widgets.dart';
import 'package:flutter_modular_mvvm/product/utility/pagination/controller/pagination_controller.dart';
import 'package:flutter_modular_mvvm/product/utility/pagination/debouncer/pagination_debouncer.dart';

class PaginatedBuilder extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    ScrollController controller,
  ) builder;

  final VoidCallback onFetchMore;
  final int debouncerWaitDuration;

  const PaginatedBuilder({
    Key? key,
    required this.builder,
    required this.onFetchMore,
    this.debouncerWaitDuration = 3000,
  }) : super(key: key);

  @override
  State<PaginatedBuilder> createState() => _PaginatedBuilderState();
}

class _PaginatedBuilderState extends State<PaginatedBuilder> {
  late ScrollController controller;
  late PaginationDebouncer debouncer;
  late PaginationController paginationController;

  @override
  void initState() {
    super.initState();
    paginationController = PaginationController(
      onFetchMore: widget.onFetchMore,
      waitTime: widget.debouncerWaitDuration,
      controller: controller,
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
