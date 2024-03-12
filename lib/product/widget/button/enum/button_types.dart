import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

/// The class used to manage button style.
enum ButtonType {
  /// Primary button type
  primary,

  /// Secondary button type
  secondary,

  /// Tertiary button type
  tertiary,
}

/// Button Type Extension
extension ButtonTypeExtension on ButtonType {
  /// Get color according to button type.
  Color get backgroundColor {
    switch (this) {
      case ButtonType.primary:
        return ColorName.primary;
      case ButtonType.secondary:
        return ColorName.primary3;
      case ButtonType.tertiary:
        return ColorName.backgroundSecondary;
    }
  }

  Color get fontColor {
    switch (this) {
      case ButtonType.primary:
        return ColorName.primary4;
      case ButtonType.secondary:
        return ColorName.primary;
      case ButtonType.tertiary:
        return ColorName.primary3;
    }
  }
}
