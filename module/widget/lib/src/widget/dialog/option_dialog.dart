import 'package:flutter/material.dart';
import 'package:widget/src/core/dialog_base.dart';
import 'package:widget/src/widget/dialog/components/dialog_button.dart';

/// A dialog that presents options to the user and returns a boolean value
/// based on the user's selection.
///
/// The [OptionDialog] is a [StatefulWidget] that displays a dialog with
/// a title, a message, and two action buttons: close and check. The user can
/// select either the close button or the check button, and the dialog will
/// return a boolean value indicating the user's selection. If the user selects
/// the close button, the dialog will return `false`. If the user selects the
/// check button, the dialog will return `true`.
///
/// To show the [OptionDialog], use the static method [OptionDialog.show] and
/// provide the required parameters: [title], [message], and [context].
/// The [OptionDialog.show] method will return a [Future<bool?>]
/// that represents the user's selection.
///
/// Example usage:
/// ```dart
/// bool? result = await OptionDialog.show(
///   title: 'Confirmation',
///   message: 'Are you sure you want to proceed?',
///   context: context,
/// );
/// if (result == true) {
///   // User selected the check button
///   // Proceed with the desired action
/// } else {
///   // User selected the close button or dismissed the dialog
///   // Handle accordingly
/// }
/// ```

class OptionDialog extends StatefulWidget {
  /// Constructor for dialog
  const OptionDialog({
    required this.closeButtonText,
    required this.checkButtonText,
    required this.showActionIcons,
    super.key,
    this.title,
    this.message,
    this.closeColor,
    this.checkColor,
  });

  /// Title for the dialog.
  final String? title;

  /// Message for the dialog.
  final String? message;

  /// Text for the close button.
  final String closeButtonText;

  /// Text for the check button.
  final String checkButtonText;

  /// If it's true, the dialog will display the action icons.
  /// Otherwise, the dialog will display the only action texts.
  ///
  /// Defaults to false.
  final bool showActionIcons;

  final Color? closeColor;

  final Color? checkColor;

  @override
  State<OptionDialog> createState() => _OptionDialogState();

  /// The static method [OptionDialog.show] displays a dialog with the
  /// specified [title] and [message] and returns a [Future<bool?>] that
  /// represents the user's selection.
  static Future<bool?> show({
    required BuildContext context,
    required String closeButtonText,
    required String checkButtonText,
    String? title,
    String? message,
    bool showActionIcons = false,
    Color? closeColor,
    Color? checkColor,
  }) async {
    return DialogBase.show<bool>(
      context: context,
      builder: (context) => OptionDialog(
        title: title,
        message: message,
        closeButtonText: closeButtonText,
        checkButtonText: checkButtonText,
        showActionIcons: showActionIcons,
        checkColor: checkColor,
        closeColor: closeColor,
      ),
    );
  }
}

class _OptionDialogState extends State<OptionDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: widget.title != null ? Text(widget.title!) : null,
      content: widget.message != null ? Text(widget.message!) : null,
      actions: [
        DialogButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          label: widget.closeButtonText,
          icon: const Icon(Icons.close),
          color: widget.closeColor,
          showIcon: widget.showActionIcons,
        ),
        DialogButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          label: widget.checkButtonText,
          icon: const Icon(Icons.check),
          color: widget.checkColor,
          showIcon: widget.showActionIcons,
        ),
      ],
    );
  }
}
