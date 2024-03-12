// ignore_for_file: public_member_api_docs

import 'package:flutter/widgets.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/extension/responsive_ext.dart';

class ProjectSpacer extends SizedBox {
  const ProjectSpacer._() : super.shrink();

  ProjectSpacer.xSmallHeight(BuildContext context, {super.key})
      : super(height: 4.responsivePadding(context));
  ProjectSpacer.smallHeight(BuildContext context, {super.key})
      : super(height: 6.responsivePadding(context));
  ProjectSpacer.mediumHeight(BuildContext context, {super.key})
      : super(height: 8.responsivePadding(context));
  ProjectSpacer.largeHeight(BuildContext context, {super.key})
      : super(height: 12.responsivePadding(context));
  ProjectSpacer.xLargeHeight(BuildContext context, {super.key})
      : super(height: 16.responsivePadding(context));

  ProjectSpacer.xSmallWidth(BuildContext context, {super.key})
      : super(width: 4.responsivePadding(context));
  ProjectSpacer.smallWidth(BuildContext context, {super.key})
      : super(width: 6.responsivePadding(context));
  ProjectSpacer.mediumWidth(BuildContext context, {super.key})
      : super(width: 8.responsivePadding(context));
  ProjectSpacer.largeWidth(BuildContext context, {super.key})
      : super(width: 12.responsivePadding(context));
  ProjectSpacer.xLargeWidth(BuildContext context, {super.key})
      : super(width: 16.responsivePadding(context));

  ProjectSpacer.xSmallSquare(BuildContext context, {super.key})
      : super.square(dimension: 4.responsivePadding(context));
  ProjectSpacer.smallSquare(BuildContext context, {super.key})
      : super.square(dimension: 6.responsivePadding(context));
  ProjectSpacer.mediumSquare(BuildContext context, {super.key})
      : super.square(dimension: 8.responsivePadding(context));
  ProjectSpacer.largeSquare(BuildContext context, {super.key})
      : super.square(dimension: 12.responsivePadding(context));
  ProjectSpacer.xLargeSquare(BuildContext context, {super.key})
      : super.square(dimension: 16.responsivePadding(context));
}
