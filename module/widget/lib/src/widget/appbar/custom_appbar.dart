import 'package:flutter/material.dart';

/// Project custom appbar.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Project custom appbar constructor.
  const CustomAppBar({
    required this.title,
    this.prefix,
    this.actions,
    super.key,
    this.backgroundColor,
  });

  /// AppBar's title.
  final Widget title;

  /// AppBar's prefix.
  final Widget? prefix;

  /// AppBar's suffix.
  final List<Widget>? actions;

  /// AppBar's background color.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: prefix,
      leadingWidth: 100,
      actions: actions,
      //automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
