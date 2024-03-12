import 'package:core/core.dart';
import 'package:flutter_modular_mvvm/product/cache/model/auth_cache_model.dart';
import 'package:flutter_modular_mvvm/product/cache/model/user_cache_model.dart';

/// [ProductCache] is a cache manager for the product module.
final class ProductCache {
  /// constructor
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  /// [init] is a method for init cache manager.
  Future<void> init() async {
    await _cacheManager.init(
      items: [
        UserCacheModel.empty(),
        AuthCacheModel.empty(),
      ],
    );
  }

  /// [userCacheOperation] is a cache operation for [UserCacheModel].
  late final HiveCacheOperation<UserCacheModel> userCacheOperation =
      HiveCacheOperation<UserCacheModel>();

  /// [authCacheOperation] is a cache operation for [AuthCacheModel].
  late final HiveCacheOperation<AuthCacheModel> authCacheOperation =
      HiveCacheOperation<AuthCacheModel>();
}
