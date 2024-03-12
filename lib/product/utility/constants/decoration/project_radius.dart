import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

enum ProjectRadius {
  /// 8.
  small(8),

  /// 16.
  medium(16),

  /// 20.
  normal(20),

  /// 32.
  large(32);

  final double value;
  const ProjectRadius(this.value);

  double responsive(BuildContext context) => context.sized.height * value / 600;

  BorderRadius radius(BuildContext context) =>
      BorderRadius.circular(responsive(context));

  BorderRadius radiusOnlyTop(BuildContext context) => BorderRadius.only(
        topLeft: Radius.circular(responsive(context)),
        topRight: Radius.circular(responsive(context)),
      );
}
