import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/index.dart';

/// A custom loading widget that displays a circular progress indicator.
final class CustomLoading extends StatelessWidget {
  /// Creates a new [CustomLoading] instance.
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: ProjectPadding.allMedium(context),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: ColorName.primary4,
          borderRadius: ProjectRadius.large.radius(context),
          boxShadow: [
            BoxShadow(
              color: ColorName.primary2.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const LoadingIndicator(
          indicatorType: Indicator.ballTrianglePathColoredFilled,
          colors: [
            ColorName.backgroundPrimary,
            ColorName.primary,
            ColorName.primary2,
          ],
        ),
      ),
    );
  }
}
