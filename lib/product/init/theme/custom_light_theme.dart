import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_modular_mvvm/product/init/theme/color/custom_color_scheme.dart';
import 'package:flutter_modular_mvvm/product/init/theme/custom_theme.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme: CustomColorScheme.lightColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();

  @override
  DialogTheme get dialogTheme => DialogTheme(
        titleTextStyle: TextStyle(
          color: ColorName.primary,
          fontSize: const TextTheme().headlineSmall?.fontSize,
          fontWeight: const TextTheme().headlineSmall?.fontWeight,
        ),
        contentTextStyle: TextStyle(
          color: ColorName.backgroundPrimary,
          fontSize: const TextTheme().bodySmall?.fontSize,
          fontWeight: const TextTheme().bodySmall?.fontWeight,
        ),
      );
}
