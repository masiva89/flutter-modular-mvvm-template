import 'package:flutter/material.dart';

/// Interface for text field validator.
///
/// This interface is used to validate text field.
abstract class ITextFieldValidator {
  /// Text controller of text field.
  String get textController;

  /// TextField validator method.
  ///
  /// This method is used to validate text field.
  /// You can fill method body with your own validation logic.
  /// [alertWidget] must be initialized in this method.
  bool validate({String? value});

  /// Alert widget of text field.
  ///
  /// This widget is used to show alert when text field is invalid.
  Widget? get alertWidget;

  /// Update method of text field.
  ///
  /// This method is used to update text field value.
  /// [value] is the new value of text field.
  bool onUpdate(String value);
}
