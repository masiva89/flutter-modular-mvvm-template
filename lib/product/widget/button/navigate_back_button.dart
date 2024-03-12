import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_size.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_spacer.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/text_styles.dart';

/// The button used to go back.
class NavigateBackButton extends StatelessWidget {
  /// constructor
  const NavigateBackButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  /// title text
  final String title;

  /// button on pressed
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(left: ProjectSize.small.responsive(context)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.icons.backFilled.svg(
              package: 'gen',
            ),
            ProjectSpacer.xSmallWidth(context),
            Text(
              title,
              style: TextStyles.textButton(context, color: ColorName.primary4),
            ),
          ],
        ),
      ),
    );
  }
}
