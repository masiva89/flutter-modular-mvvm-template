import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/project_size.dart';
import 'package:flutter_modular_mvvm/product/widget/button/index.dart';
import 'package:widget/widgets.dart';

/// Custom appbar for auth pages
class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Default constructor
  const AuthAppBar({super.key, this.isBackButtonVisible = false});

  final bool isBackButtonVisible;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Assets.images.mainLogoSvg.svg(
        package: 'gen',
        height: ProjectSize.xxlarge.responsive(context),
      ),
      prefix: isBackButtonVisible
          ? NavigateBackButton(
              title: 'Geri',
              onPressed: () {
                context.router.pop();
              },
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
