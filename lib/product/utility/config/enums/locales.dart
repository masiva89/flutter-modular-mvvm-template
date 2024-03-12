import 'package:flutter/material.dart';

/// Project locale enum for operation and configuration
enum Locales {
  /// Turkish locale
  tr(Locale('tr', 'TR')),

  /// English locale
  en(Locale('en', 'US'));

  /// Locale value
  final Locale locale;

  const Locales(this.locale);

  static List<Locale> locales = Locales.values.map((e) => e.locale).toList();
}
