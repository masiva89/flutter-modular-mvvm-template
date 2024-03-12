import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_modular_mvvm/product/navigation/app_router.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/enum/user_status.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/mixin/guard_mixin.dart';
import 'package:flutter_modular_mvvm/product/widget/dialog/project_dialog.dart';

/// A guard that restricts access to certain pages based on the user's
/// authentication status. This guard is used to prevent unauthorized access to
/// protected pages.
class AuthRestrictedPageGuard extends AutoRouteGuard with GuardMixin {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    log('--- AuthRestrictedPageGuard ---');
    switch (userAuthStatus) {
      case UserStatus.loggedIn:
        log('User is logged in');
        resolver.next();
      case UserStatus.notLoggedIn || UserStatus.notVerified:
        log('User is not logged in');
        final result = await ProjectDialog.showOptionDialog(
          context: router.navigatorKey.currentState!.context,
          title: 'Giriş Yap',
          content: 'Bu özellikten faydalanmak için giriş yapmalısınız.',
          checkButtonText: 'Giriş Yap',
        );
        if (result) {
          // TODO: Complete the function.
          //await router.replaceAll([const AuthNavRoute()]);
        }
    }
  }
}
