import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/extension/responsive_ext.dart';

enum ProjectPaddingEnum {
  xSmall(4),
  small(6),
  medium(8),
  large(12),
  xLarge(16);

  final int _value;
  const ProjectPaddingEnum(this._value);

  double responsive(BuildContext context) {
    return _value.responsivePadding(context);
  }

  EdgeInsets paddingAll(BuildContext context) {
    return EdgeInsets.all(responsive(context));
  }

  EdgeInsets paddingHorizontal(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: responsive(context));
  }

  EdgeInsets paddingVertical(BuildContext context) {
    return EdgeInsets.symmetric(vertical: responsive(context));
  }
}

/// Project general padding items
final class ProjectPadding extends EdgeInsets {
  const ProjectPadding._() : super.all(0);

  /// [ProjectPadding.allXSmall] is 4
  ProjectPadding.allXSmall(BuildContext context)
      : super.all(ProjectPaddingEnum.xSmall.responsive(context));

  /// [ProjectPadding.allSmall] is 6
  ProjectPadding.allSmall(BuildContext context)
      : super.all(ProjectPaddingEnum.small.responsive(context));

  /// [ProjectPadding.allMedium] is 8
  ProjectPadding.allMedium(BuildContext context)
      : super.all(ProjectPaddingEnum.medium.responsive(context));

  /// [ProjectPadding.allLarge] is 12
  ProjectPadding.allLarge(BuildContext context)
      : super.all(ProjectPaddingEnum.large.responsive(context));

  /// [ProjectPadding.allXLarge] is 16
  ProjectPadding.allXLarge(BuildContext context)
      : super.all(ProjectPaddingEnum.xLarge.responsive(context));

  /// [ProjectPadding.horizontalXSmall] is 20
  ProjectPadding.horizontalXSmall(BuildContext context)
      : super.symmetric(
          horizontal: ProjectPaddingEnum.xSmall.responsive(context),
        );

  /// [ProjectPadding.horizontalSmall] is 6
  ProjectPadding.horizontalSmall(BuildContext context)
      : super.symmetric(
          horizontal: ProjectPaddingEnum.small.responsive(context),
        );

  /// [ProjectPadding.horizontalMedium] is 8
  ProjectPadding.horizontalMedium(BuildContext context)
      : super.symmetric(
          horizontal: ProjectPaddingEnum.medium.responsive(context),
        );

  /// [ProjectPadding.horizontalLarge] is 12
  ProjectPadding.horizontalLarge(BuildContext context)
      : super.symmetric(
          horizontal: ProjectPaddingEnum.large.responsive(context),
        );

  /// [ProjectPadding.horizontalXLarge] is 16
  ProjectPadding.horizontalXLarge(BuildContext context)
      : super.symmetric(
          horizontal: ProjectPaddingEnum.xLarge.responsive(context),
        );

  /// [ProjectPadding.verticalXSmall] is 4
  ProjectPadding.verticalXSmall(BuildContext context)
      : super.symmetric(
          vertical: ProjectPaddingEnum.xSmall.responsive(context),
        );

  /// [ProjectPadding.verticalSmall] is 6
  ProjectPadding.verticalSmall(BuildContext context)
      : super.symmetric(vertical: ProjectPaddingEnum.small.responsive(context));

  /// [ProjectPadding.verticalMedium] is 8
  ProjectPadding.verticalMedium(BuildContext context)
      : super.symmetric(
          vertical: ProjectPaddingEnum.medium.responsive(context),
        );

  /// [ProjectPadding.verticalLarge] is 12
  ProjectPadding.verticalLarge(BuildContext context)
      : super.symmetric(vertical: ProjectPaddingEnum.large.responsive(context));

  /// [ProjectPadding.verticalXLarge] is 16
  ProjectPadding.verticalXLarge(BuildContext context)
      : super.symmetric(
          vertical: ProjectPaddingEnum.xLarge.responsive(context),
        );
}
