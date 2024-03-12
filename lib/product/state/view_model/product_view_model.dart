import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/cache/mixin/auth_cache_cubit_mixin.dart';
import 'package:flutter_modular_mvvm/product/state/base/base_cubit.dart';
import 'package:flutter_modular_mvvm/product/state/view_model/product_state.dart';

/// [ProductViewModel] is a view model for the product module.
final class ProductViewModel extends BaseCubit<ProductState>
    with AuthCacheCubitMixin {
  /// [ProductViewModel] constructor.
  ProductViewModel() : super(const ProductState());

  @override
  void initialEvent({BuildContext? context}) {}

  /// Change theme mode
  /// [themeMode] can be [ThemeMode.light] or [ThemeMode.dark]
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
