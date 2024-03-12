import 'package:flutter/material.dart';

/// A class that represents the sizes of a text field.
///
/// This class is used to set the sizes of a text field.
class TextFieldSizes {
  /// Constructs a [TextFieldSizes] instance with the given parameters.
  TextFieldSizes({
    this.fontSize,
    this.height,
    this.width,
    this.iconSize,
    this.padding,
    this.radius,
  });

  /// TextField's font size.
  final double? fontSize;

  /// TextField's height.
  final double? height;

  /// TextField's width.
  final double? width;

  /// TextField's icon size.
  final double? iconSize;

  /// TextField's padding.
  final EdgeInsets? padding;

  /// TextField's border radius.
  final double? radius;
}
