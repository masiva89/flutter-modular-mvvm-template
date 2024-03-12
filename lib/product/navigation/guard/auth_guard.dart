import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/navigation/app_router.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/enum/user_status.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/mixin/guard_mixin.dart';

@immutable

/// Project router information class
class AuthGuard extends AutoRouteGuard with GuardMixin {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    switch (userAuthStatus) {
      case UserStatus.loggedIn:
        log('User is logged in');
        resolver.next();
      case UserStatus.notLoggedIn || UserStatus.notVerified:
        log('User is not logged in');
      // TODO: Complete the function.
      //resolver.redirect(const LoginRoute());
    }
  }

  /* UserStatus get userAuthStatus {
    final authCacheModel =
        
    if (authCacheModel == null) return UserStatus.notLoggedIn;

    return authCacheModel.userStatus;
  } */
}
