import 'package:flutter/widgets.dart';
import 'package:flutter_modular_mvvm/product/utility/pagination/pagination_debouncer.dart';

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

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    debouncer = PaginationDebouncer(waitTime: widget.debouncerWaitDuration);
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (controller.position.extentAfter == 0) {
        debouncer.debounce(() {
          widget.onFetchMore();
        });
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: widget.builder(context, controller),
    );
  }
}
