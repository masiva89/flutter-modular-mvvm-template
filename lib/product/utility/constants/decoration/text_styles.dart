// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/enums/font_sizes.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/extension/responsive_ext.dart';

/// Project text styles for operation and configuration
final class TextStyles {
  TextStyles._();

  static TextStyle header1(
    BuildContext context, {
    Color color = ColorName.primary4,
  }) {
    return TextStyle(
      fontSize: FontSizes.header1.responsive(context),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle header2(
    BuildContext context, {
    Color color = ColorName.primary4,
  }) {
    return TextStyle(
      fontSize: FontSizes.header2.responsive(context),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle header3(
    BuildContext context, {
    Color color = ColorName.primary4,
  }) {
    return TextStyle(
      fontSize: FontSizes.header3.responsive(context),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle subtitle1(
    BuildContext context, {
    Color color = ColorName.primary4,
  }) {
    return TextStyle(
      fontSize: FontSizes.subtitle1.responsive(context),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle subtitle2(
    BuildContext context, {
    Color color = ColorName.primary4,
  }) {
    return TextStyle(
      fontSize: FontSizes.subtitle2.responsive(context),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle body(
    BuildContext context, {
    Color color = ColorName.primary4,
  }) {
    return TextStyle(
      fontSize: FontSizes.body.responsive(context),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle button(
    BuildContext context, {
    Color color = ColorName.primary4,
  }) {
    return TextStyle(
      fontSize: FontSizes.button.responsive(context),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle miniButton(
    BuildContext context, {
    Color color = ColorName.primary4,
  }) {
    return TextStyle(
      fontSize: FontSizes.miniButton.responsive(context),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle textButton(
    BuildContext context, {
    Color color = ColorName.primary,
  }) {
    return TextStyle(
      fontSize: FontSizes.textButton.responsive(context),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }
}
