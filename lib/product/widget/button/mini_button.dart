import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_padding.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_radius.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/text_styles.dart';
import 'package:flutter_modular_mvvm/product/widget/button/enum/button_types.dart';

/// radius is 20
final class MiniButton extends StatelessWidget {
  /// constructor
  const MiniButton({
    required this.title,
    required this.onPressed,
    super.key,
    this.buttonType = ButtonType.primary,
  });

  /// title text
  final String title;

  /// button on pressed
  final VoidCallback onPressed;

  /// is primary
  ///
  /// default is true.
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      radius: ProjectRadius.small.responsive(context),
      borderRadius: ProjectRadius.small.radius(context),
      child: Ink(
        padding: ProjectPadding.allMedium(context),
        decoration: BoxDecoration(
          color: buttonType.backgroundColor,
          border: Border.all(
            color: ColorName.primary,
          ),
          borderRadius: ProjectRadius.small.radius(context),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: context.sized.width * 0.4,
          ),
          child: Center(
            child: Text(
              title,
              style:
                  TextStyles.miniButton(context, color: buttonType.fontColor),
            ),
          ),
        ),
      ),
    );
  }
}
