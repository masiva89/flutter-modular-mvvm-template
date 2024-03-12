import 'package:flutter/material.dart';

class AppBarSwitcher extends StatefulWidget implements PreferredSizeWidget {
  const AppBarSwitcher({required this.appBar, super.key});

  final PreferredSizeWidget appBar;

  @override
  State<AppBarSwitcher> createState() => _AppBarSwitcherState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarSwitcherState extends State<AppBarSwitcher> {
  late PreferredSizeWidget _appBar;

  @override
  void initState() {
    super.initState();
    _appBar = widget.appBar;
  }

  @override
  void didUpdateWidget(covariant AppBarSwitcher oldWidget) {
    super.didUpdateWidget(oldWidget);
    _appBar = widget.appBar;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        //TODO: change with better transition
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: _appBar,
    );
  }
}
