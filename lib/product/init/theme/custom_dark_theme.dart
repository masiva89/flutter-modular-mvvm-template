import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/init/index.dart';
import 'package:gen/gen.dart';

/// Custom light theme for project design
final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        appBarTheme: CustomAppBarTheme.appBarTheme,
        bottomSheetTheme: CustomBottomsheetTheme.bottomSheetThemeData,
        splashColor: ColorName.primary2.withOpacity(0.2),
        highlightColor: ColorName.primary2.withOpacity(0.2),
        scaffoldBackgroundColor: ColorName.backgroundPrimary,
        dialogTheme: dialogTheme,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();

  @override
  final DialogTheme dialogTheme = DialogTheme(
    titleTextStyle: TextStyle(
      color: ColorName.primary3,
      fontSize: 24,
      fontWeight: const TextTheme().titleMedium?.fontWeight,
    ),
    contentTextStyle: TextStyle(
      color: ColorName.primary4,
      fontSize: 18,
      fontWeight: const TextTheme().bodyMedium?.fontWeight,
    ),
  );
}
