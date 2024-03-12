// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/navigation/app_router.dart';
import 'package:flutter_modular_mvvm/product/widget/button/normal_button.dart';
import 'package:widget/widgets.dart';

part 'custom_signup_button_mixin.dart';

final class CustomSignupButton extends StatefulWidget {
  const CustomSignupButton({required this.onOperation, super.key});
  final AsyncValueGetter<bool> onOperation;
  @override
  State<CustomSignupButton> createState() => _CustomSignupButtonState();
}

class _CustomSignupButtonState extends State<CustomSignupButton>
    with MountedMixin, _CustomSignupButtonMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoadingNotifier,
      builder: (BuildContext context, bool value, Widget? child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: NormalButton(
            title: 'Hesabını Oluştur',
            isLoading: value,
            onPressed: () async {
              if (value) return;
              print('tapped');
              await _onPressed(context);
            },
          ),
        );
      },
    );
  }
}
