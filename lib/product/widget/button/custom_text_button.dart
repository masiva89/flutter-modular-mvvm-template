import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_padding.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_radius.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/text_styles.dart';

/// CustomTextButton
class CustomTextButton extends StatelessWidget {
  /// constructor
  const CustomTextButton({
    required this.title,
    required this.onPressed,
    super.key,
    this.isActive = true,
  });

  /// title text
  final String title;

  /// button on pressed
  final VoidCallback onPressed;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: ProjectPadding.allXSmall(context),
        shape: RoundedRectangleBorder(
          borderRadius: ProjectRadius.small.radius(context),
        ),
      ),
      onPressed: isActive ? onPressed : null,
      child: Text(
        title,
        style: TextStyles.textButton(context),
      ),
    );
  }
}
