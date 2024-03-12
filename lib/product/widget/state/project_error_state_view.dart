import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/index.dart';
import 'package:flutter_modular_mvvm/product/widget/button/index.dart';

/// Project error state view.
class ProjectErrorStateView extends StatelessWidget {
  /// Creates a new project error state view instance.
  ///
  /// The [title] and [description] parameters are optional. If provided, they
  /// will be displayed in the view.
  ///
  /// The [onRetry] parameter is optional. If provided, a retry button will be
  /// displayed in the view.
  const ProjectErrorStateView({
    super.key,
    this.title,
    this.description,
    this.onRetry,
  });

  /// The title of the view.
  /// If not provided, a default title will be displayed.
  final String? title;

  /// The description of the view.
  /// If not provided, a default description will be displayed.
  final String? description;

  /// The function that will be called when the retry button is pressed.
  /// If not provided, the retry button will not be displayed.
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.allMedium(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.errorViewImage.svg(
            package: 'gen',
            height: context.general.mediaSize.height * 0.2,
          ),
          ProjectSpacer.xLargeHeight(context),
          Text(
            title ?? 'Haydaa!',
            textAlign: TextAlign.center,
            style: TextStyles.header2(context),
          ),
          ProjectSpacer.mediumHeight(context),
          Text(
            description ??
                'Bir şeyler ters gitmiş gibi görünüyor. Lütfen daha sonra tekrar deneyin.',
            textAlign: TextAlign.center,
            style: TextStyles.body(context),
          ),
          ProjectSpacer.xLargeHeight(context),
          ProjectSpacer.xLargeHeight(context),
          if (onRetry != null) ...{
            MiniButton(
              title: 'Tekrar Dene',
              onPressed: onRetry!,
            ),
          },
        ],
      ),
    );
  }
}
