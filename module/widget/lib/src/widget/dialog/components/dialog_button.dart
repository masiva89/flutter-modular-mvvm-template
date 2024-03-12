import 'package:flutter/material.dart';

/// A button widget used in dialogs.
class DialogButton extends StatelessWidget {
  /// Creates a [DialogButton].
  ///
  /// The [label] parameter is required and specifies the button label.
  ///
  /// The [onPressed] parameter is required and specifies the callback function
  /// when the button is pressed.
  ///
  /// The [icon] parameter is required and
  /// specifies the button icon.
  ///
  /// The [showIcon] parameter is optional and
  /// specifies whether to show the button icon. By default, it is set to true.
  const DialogButton({
    required this.label,
    required this.onPressed,
    required this.icon,
    super.key,
    this.showIcon = true,
    this.color,
  });

  /// The button label.
  final String label;

  /// The callback function when the button is pressed.
  final VoidCallback onPressed;

  /// The button icon.
  final Widget icon;

  /// Whether to show the button icon.
  final bool? showIcon;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return switch (showIcon ?? false) {
      true => TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: color ?? Theme.of(context).primaryColor,
          ),
          onPressed: onPressed,
          icon: icon,
          label: Text(label),
        ),
      false => TextButton(
          style: TextButton.styleFrom(
            foregroundColor: color ?? Theme.of(context).primaryColor,
          ),
          onPressed: onPressed,
          child: Text(label),
        ),
    };
  }
}
