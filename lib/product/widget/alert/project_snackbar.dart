// ignore_for_file: comment_references

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/main.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_radius.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/text_styles.dart';
import 'package:flutter_modular_mvvm/product/widget/alert/enum/alert_icon_setter.dart';
import 'package:widget/widgets.dart';

/// Enum representing different types of project snackbars.
///
/// The [ProjectSnackbarType] enum is used to define the different types of
/// snackbars that can be displayed in the project.
///
/// It includes the following types:
/// - [success]: Represents a success message.
/// - [error]: Represents an error message.
/// - [warning]: Represents a warning message.
/// - [info]: Represents an informational message.
enum ProjectSnackbarType {
  /// Represents a success message.
  success,

  /// Represents an error message.
  error,

  /// Represents a warning message.
  warning,

  /// Represents an informational message.
  info,
}

/// Represents a custom snackbar that can be shown in the app.
///
/// The [ProjectSnackbar] class provides a way to display different types of
/// snackbars such as success, error, warning, and info. It takes a [message]
/// and [type] as required parameters, and an optional [title] and [duration]
/// parameters.
///
/// The [show] method is used to display the snackbar. It checks if the
/// [scaffoldMessengerKey] is not null, clears any existing snackbars, and then
/// shows the custom snackbar.
//@immutable
class ProjectSnackbar {
  /// ProjectSnackbar Constructor
  ProjectSnackbar({
    required this.message,
    required this.type,
    this.title,
    this.duration = const Duration(seconds: 3),
  }) {
    customSnackbar = CustomSnackbar(
      scaffoldMessengerState: scaffoldMessengerKey.currentState!,
      radius: ProjectRadius.medium.responsive(context),
      primaryColor: ColorName.primary,
      secondaryColor: ColorName.backgroundSecondary,
      tertiaryColor: ColorName.primary3,
      elevation: 0,
      message: message,
      title: title,
      duration: duration,
      titleTextStyle: TextStyles.subtitle1(context, color: ColorName.primary3),
      messageTextStyle: TextStyles.body(context),
      icon: type.icon(context),
      animation: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );
  }

  /// Creates an animation controller for the project snackbar.
  ///
  /// The animation controller is used to control the animation of the project
  /// snackbar. It can be used to start, stop, or reverse the animation.
  final AnimationController animationController = AnimationController(
    vsync: scaffoldMessengerKey.currentState!,
    duration: const Duration(milliseconds: 1000),
  );

  /// A variable to hold an instance of [CustomSnackbar].
  late CustomSnackbar customSnackbar;

  /// Returns the [BuildContext] associated with the current
  /// [ScaffoldMessenger].
  ///
  /// This method retrieves the [BuildContext] from the [scaffoldMessengerKey]
  /// and returns it. The [BuildContext] is used to access the current
  /// [Scaffold] and its related widgets.
  ///
  /// Returns:
  ///   - The [BuildContext] associated with the current [ScaffoldMessenger].
  ///
  /// Throws:
  ///   - [NoSuchMethodError] if the [scaffoldMessengerKey] is null or if the
  /// [ScaffoldMessenger] is not yet initialized.
  ///
  /// Example usage:
  /// ```dart
  /// BuildContext get context => scaffoldMessengerKey.currentState!.context;
  /// ```
  BuildContext get context => scaffoldMessengerKey.currentState!.context;

  /// Snackbar message text.
  final String message;

  /// Snackbar title text.
  final String? title;

  /// Snackbar type.
  final ProjectSnackbarType type;

  /// Snackbar duration.
  final Duration duration;

  /// Shows a custom snackbar with the specified [message] and [duration].
  /// If [scaffoldMessengerKey.currentState] is null, the snackbar will not be
  /// shown. The existing snackbars in the [scaffoldMessengerKey.currentState]
  /// will be cleared before showing the new snackbar.
  void show() {
    if (scaffoldMessengerKey.currentState == null) {
      //print('scaffoldMessengerKey.currentState is null');
      return;
    }
    scaffoldMessengerKey.currentState!.clearSnackBars();
    customSnackbar.show(
      message: message,
      duration: duration,
    );
    //print('snackbar showed');
  }
}
