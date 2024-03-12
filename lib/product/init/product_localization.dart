import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/utility/config/enums/locales.dart';

@immutable

/// Product localization manager
final class ProductLocalization extends EasyLocalization {
  /// ProductLocalization need to [child] for a wrap locale item
  ProductLocalization({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedItems,
          path: _translationPath,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedItems = Locales.locales;

  static const String _translationPath = 'assets/translations';

  /// Change project language by using [Locales]
  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}
