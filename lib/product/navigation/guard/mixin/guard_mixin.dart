import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_modular_mvvm/product/cache/path/cache_path.dart';
import 'package:flutter_modular_mvvm/product/cache/product_cache.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/enum/user_status.dart';
import 'package:flutter_modular_mvvm/product/state/container/index.dart';

/// [GuardMixin] is a mixin for guards.
mixin GuardMixin on AutoRouteGuard {
  ProductCache get _productCache => ProductStateItems.productCache;

  /// [userAuthStatus] is a getter for user auth status.
  ///
  /// It returns [UserStatus] enum to use in guards.
  UserStatus get userAuthStatus {
    log('[userAuthStatus]');
    final authCacheModel =
        _productCache.authCacheOperation.get(CachePath.auth.value);
    if (authCacheModel == null) return UserStatus.notLoggedIn;
    log('[userAuthStatus] ${authCacheModel.userStatus}');
    return authCacheModel.userStatus;
  }
}
