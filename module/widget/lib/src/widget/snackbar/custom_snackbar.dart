import 'package:flutter/material.dart';
import 'package:widget/src/core/custom_snackbar_decoration.dart';
import 'package:widget/src/core/snackbar_base.dart';

/// Custom Snackbar Widget
class CustomSnackbar extends SnackBar with SnackbarBase {
  /// Custom Snackbar Widget
  CustomSnackbar({
    required this.radius,
    required this.duration,
    required this.scaffoldMessengerState,
    this.animation,
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.elevation,
    super.key,
    this.message,
    this.title,
    this.icon,
    this.titleTextStyle,
    this.messageTextStyle,
    this.content = const Placeholder(),
  }) : super(
          backgroundColor: primaryColor,
          behavior: SnackBarBehavior.floating,
          duration: duration,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          content: content,
          padding: EdgeInsets.zero,
          animation: animation,
        );

  @override
  final double radius;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? tertiaryColor;
  @override
  final double? elevation;

  final String? message;
  final String? title;
  @override
  final Duration duration;
  @override
  final Animation<double>? animation;

  final TextStyle? titleTextStyle;
  final TextStyle? messageTextStyle;

  final Widget? icon;

  final ScaffoldMessengerState scaffoldMessengerState;

  @override
  Widget content = const Placeholder();

  /// Show a general information snackbar.
  Future<void> show({
    required String message,
    Duration? duration,
  }) async {
    await showSnackbar<CustomSnackbar>(
      scaffoldMessengerState: scaffoldMessengerState,
      duration: duration ?? this.duration,
      snackBar: CustomSnackbar(
        scaffoldMessengerState: scaffoldMessengerState,
        radius: radius,
        elevation: elevation,
        duration: duration ?? this.duration,
        animation: animation,
        content: CustomSnackbarDecoration(
          message: message,
          title: title,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
          tertiaryColor: tertiaryColor,
          titleTextStyle: titleTextStyle,
          messageTextStyle: messageTextStyle,
          icon: icon,
          radius: radius,
        ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:widgets/src/core/snackbar_base.dart';

/// Custom Snackbar Widget
class CustomSnackbar extends SnackBar {
  /// Custom Snackbar Widget
  const CustomSnackbar(
    this.shape,
    this.primaryColor,
    this.secondaryColor,
    this.elevation,
    this.margin,
    this.padding, {
    required super.content,
    required this.dismissDirection,
    super.key,
  });

  final ShapeBorder shape;
  final Color primaryColor;
  final Color secondaryColor;
  final double elevation;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final DismissDirection dismissDirection;

  static Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>>
      show({
    required BuildContext context,
    required String message,
    required String actionLabel,
  }) async {
    return SnackbarBase.show(
      context: context,
      snackBar: CustomSnackbar(
        shape,
        primaryColor,
        secondaryColor,
        elevation,
        margin,
        padding,
        content: content,
        dismissDirection: dismissDirection,
      ),
    ).then((value) async {
      await value.closed.then((value) {
        if (value == SnackBarClosedReason.action) {
          print('Action button of snackbar is clicked');
        } else {
          print('Snackbar is dismissed');
        }
      });
      return value;
    });
  }

  /// Snackbar widget builder.
  Widget build(BuildContext context) {
    return SnackBar(
      content: content,
      key: key,
      action: action,
      backgroundColor: backgroundColor,
      behavior: behavior,
      duration: duration,
      elevation: elevation,
      margin: margin,
      padding: padding,
      shape: shape,
      dismissDirection: dismissDirection,
    );
  }
}
 */