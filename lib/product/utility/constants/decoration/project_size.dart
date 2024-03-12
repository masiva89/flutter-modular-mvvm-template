// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/extension/responsive_ext.dart';

enum ProjectSize {
  xxsmall(4),
  xsmall(8),
  small(12),
  medium(16),
  large(20),
  xlarge(24),
  xxlarge(28);

  final int value;
  const ProjectSize(this.value);
}

extension ProjectSizeExtension on ProjectSize {
  double responsive(BuildContext context) {
    return value.responsive(context);
  }
}
