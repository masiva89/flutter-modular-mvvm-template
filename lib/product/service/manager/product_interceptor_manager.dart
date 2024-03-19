import 'package:core/core.dart';
import 'package:flutter_modular_mvvm/product/cache/index.dart';
import 'package:flutter_modular_mvvm/product/state/index.dart';
import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/service/interceptor/mock_interceptor.dart';
import 'package:flutter_modular_mvvm/product/service/interceptor/prod_interceptor.dart';
import 'package:vexana/vexana.dart';
import 'package:dio/dio.dart' as dio;

import 'token_manager.dart';

/// A manager class for handling product interceptors.
///
/// This class provides a static method to get a list of interceptors based on
/// the provided [AppConfiguration].
class ProductInterceptorManager {
  ProductInterceptorManager._();

  /// Returns a list of interceptors based on the provided [config].
  ///
  /// If the [config] is of type [DevEnv], a [MockInterceptor] is added to the
  /// list of interceptors. The list of interceptors is then returned.
  ///
  /// If the [config] is of type [ProdEnv], a [ProdInterceptor] is added to the
  /// list of interceptors. The list of interceptors is then returned.
  static Interceptor getInterceptorByConfig(AppConfiguration config) {
    final tokenManager = TokenManager(
      authCacheOperation: HiveCacheOperation<AuthCacheModel>(),
      networkManager: ProductStateItems.productNetworkManager,
      dio: dio.Dio(),
    );
    return config is DevEnv
        ? MockInterceptor(tokenManager)
        : ProdInterceptor(tokenManager);
  }
}
