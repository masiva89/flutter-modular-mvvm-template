import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/enums/field_validator_result.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_padding.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_radius.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_size.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_spacer.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/text_styles.dart';

/// A text field alert widget.
class TextFieldAlert extends StatelessWidget {
  /// Constructor.
  const TextFieldAlert({
    required this.content,
    required this.result,
    super.key,
  });

  /// The content of the alert.
  final String content;

  /// The result of the validation.
  final FieldValidatorResult result;

  @override
  Widget build(BuildContext context) {
    Color mainColor;
    IconData mainIcon;
    if (result == FieldValidatorResult.failure) {
      mainColor = ColorName.alertDanger;
      mainIcon = Icons.info_rounded;
    } else {
      mainColor = ColorName.alertSuccess;
      mainIcon = Icons.check_circle_rounded;
    }
    return Container(
      width: double.infinity,
      padding: ProjectPadding.allSmall(context),
      decoration: BoxDecoration(
        border: Border.all(color: mainColor),
        color: mainColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(
          ProjectRadius.small.responsive(context),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            mainIcon,
            color: mainColor,
            size: ProjectSize.medium.responsive(context),
          ),
          ProjectSpacer.xSmallWidth(context),
          Expanded(
            child: Text(
              content,
              style: TextStyles.body(context, color: mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
