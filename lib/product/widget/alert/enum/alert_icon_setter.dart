import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/extension/responsive_ext.dart';
import 'package:flutter_modular_mvvm/product/widget/alert/project_snackbar.dart';

/// ProjectSnackbarType Extension
extension AlertIconExtension on ProjectSnackbarType {
  /// Icon getter
  Widget icon(BuildContext context) {
    switch (this) {
      case ProjectSnackbarType.success:
        return Icon(
          Icons.check_circle_outline_rounded,
          size: 24.responsive(context),
          color: ColorName.alertSuccess,
        );
      case ProjectSnackbarType.error:
        return Icon(
          Icons.error_rounded,
          size: 24.responsive(context),
          color: ColorName.alertDanger,
        );
      case ProjectSnackbarType.warning:
        return Icon(
          Icons.warning_rounded,
          size: 24.responsive(context),
          color: ColorName.alertInfo,
        );
      case ProjectSnackbarType.info:
        return Icon(
          Icons.info_outline_rounded,
          size: 24.responsive(context),
          color: ColorName.alertInfo,
        );
    }
  }
}
