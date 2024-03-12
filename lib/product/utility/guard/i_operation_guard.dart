import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/cache/index.dart';
import 'package:flutter_modular_mvvm/product/state/container/product_state_items.dart';

/// An abstract class representing an operation guard.
/// Operation guards are used to protect certain operations and provide
/// additional functionality.
abstract class OperationGuard {
  final HiveCacheOperation<AuthCacheModel> _authCacheOps =
      ProductStateItems.productCache.authCacheOperation;

  /// The [HiveCacheOperation] for the authentication cache model.
  HiveCacheOperation<AuthCacheModel> get authCacheOps => _authCacheOps;

  /// Calls the provided [callback] in a guarded manner.
  /// This method is used to execute an asynchronous callback while applying
  /// necessary guards.
  Future<void> callGuarded(BuildContext context, AsyncCallback callback);
}
