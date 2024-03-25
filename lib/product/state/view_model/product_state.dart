import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/state/base/base_equatable.dart';

/// [ProductState] is a state for the product module.
final class ProductState extends StateEquatable {
  /// [ProductState] constructor.
  ProductState({
    this.themeMode = ThemeMode.light,
    bool? isLoading = true,
    StateType? status,
  }) : super(
          status: status ?? StateType.LOADING,
          isLoading: isLoading ?? true,
        );

  /// [themeMode] is a theme mode for the product module.
  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode, isLoading, status];

  /// [copyWith] is a method for copying the current state.
  ProductState copyWith({
    ThemeMode? themeMode,
    bool? isLoading,
    StateType? status,
  }) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
    );
  }
}
