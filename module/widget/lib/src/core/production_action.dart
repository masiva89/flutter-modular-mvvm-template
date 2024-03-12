import 'package:flutter/material.dart';

/// Represents an action that can be performed on a production.
class ProductionAction {
  /// Creates a new instance of [ProductionAction].
  const ProductionAction({
    required this.title,
    required this.icon,
    required this.onAction,
  });

  /// The title of the action.
  final String title;

  /// The icon data of the action.
  final Widget icon;

  /// The callback function to be executed when the action is performed.
  final Function onAction;
}
