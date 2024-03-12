import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular_mvvm/product/cache/index.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/enum/user_status.dart';
import 'package:flutter_modular_mvvm/product/state/index.dart';

/// A mixin that provides common functionality for the AuthViewModel.
mixin AuthCacheCubitMixin<T> on Cubit<T> {
  HiveCacheOperation<AuthCacheModel> get _authCacheOps =>
      ProductStateItems.productCache.authCacheOperation;

  /// [userAuthStatus] is a getter for user auth status.
  ///
  /// It returns [UserStatus] enum to use in guards.
  UserStatus get userAuthStatus {
    log('[userAuthStatus]');
    final authCacheModel = _authCacheOps.get(CachePath.auth.value);
    if (authCacheModel == null) return UserStatus.notLoggedIn;
    log('[userAuthStatus] ${authCacheModel.userStatus}');
    return authCacheModel.userStatus;
  }
}
