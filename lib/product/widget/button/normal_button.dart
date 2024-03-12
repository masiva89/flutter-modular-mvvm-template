import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_padding.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_radius.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_size.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/text_styles.dart';

/// radius is 20
final class NormalButton extends StatelessWidget {
  /// constructor
  const NormalButton({
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.isActive = true,
    super.key,
    this.isPrimary = true,
  });

  /// title text
  final String title;

  /// button on pressed
  final VoidCallback onPressed;

  /// is primary
  ///
  /// default is true.
  final bool isPrimary;

  /// is loading
  final bool isLoading;

  /// is active
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive ? onPressed : null,
      radius: ProjectRadius.large.responsive(context),
      borderRadius: ProjectRadius.large.radius(context),
      child: Ink(
        height: context.sized.height * 0.07,
        width: double.infinity,
        padding: isActive ? ProjectPadding.allLarge(context) : null,
        decoration: BoxDecoration(
          color: isPrimary ? ColorName.primary : ColorName.backgroundSecondary,
          border: Border.all(
            color: ColorName.primary,
          ),
          borderRadius: ProjectRadius.large.radius(context),
        ),
        child: Stack(
          children: [
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: isLoading
                    ? SizedBox(
                        width: ProjectSize.medium.responsive(context),
                        height: ProjectSize.medium.responsive(context),
                        child: const CircularProgressIndicator.adaptive(
                          backgroundColor: ColorName.primary4,
                        ),
                      )
                    : Text(
                        title,
                        style: TextStyles.button(context),
                      ),
              ),
            ),
            if (!isActive) ...{
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: ProjectRadius.large.radius(context),
                    color: ColorName.backgroundPrimary.withOpacity(0.4),
                  ),
                ),
              ),
            },
          ],
        ),
      ),
    );
  }
}
