import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// [ProductState] is a state for the product module.
final class ProductState extends Equatable {
  /// [ProductState] constructor.
  const ProductState({this.themeMode = ThemeMode.light});

  /// [themeMode] is a theme mode for the product module.
  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];

  /// [copyWith] is a method for copying the current state.
  ProductState copyWith({
    ThemeMode? themeMode,
  }) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
