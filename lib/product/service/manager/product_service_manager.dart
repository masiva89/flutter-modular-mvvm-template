import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/service/manager/product_interceptor_manager.dart';
import 'package:logger/logger.dart';
import 'package:vexana/vexana.dart';

/// A class that manages network requests for products.
///
/// This class extends the [NetworkManager] class and is specialized for
/// handling requests related to products.
/// It provides methods for handling errors and listening to error states.
class ProductNetworkManager extends NetworkManager<EmptyModel> {
  /// Constructs a [ProductNetworkManager] with the required dependencies.
  ///
  /// The [config] parameter is an instance of [AppConfiguration] that contains
  /// the application configuration.
  ProductNetworkManager.base(AppConfiguration config)
      : super(
          options: BaseOptions(
            baseUrl: config.baseUrl,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
          isEnableLogger: config is DevEnv,
          isEnableTest: config is DevEnv,
          interceptor: ProductInterceptorManager.getInterceptorByConfig(config),
          onRefreshFail: () {
            Logger().w('Refresh token failed');
          },
          onRefreshToken: (e, newService) {
            Logger().w('Refresh token success');
            return Future.value(DioException(requestOptions: e.requestOptions));
          },
        ) {
    /* interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Add the access token to the request header
          HiveCacheOperation<AuthCacheModel> authCacheOps =
              ProductStateItems.productCache.authCacheOperation;
          final authCacheModel = authCacheOps.get(CachePath.auth.value);

          String? jwt = authCacheModel?.productUser.token;
          String? userId = authCacheModel?.productUser.userId;

          options.headers['Authorization'] = 'Bearer $jwt';
          (options.data as Map<String, dynamic>).addAll({'userId': userId});
          return handler.next(options);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          if (e.response?.statusCode == 401) {
            // If a 401 response is received, refresh the access token
            String newAccessToken = await refreshToken();

            // Update the request header with the new access token
            e.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';

            // Repeat the request with the updated header
            return handler.resolve(await super.fetch(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    ); */
    /* final initialInterceptor = ProductInterceptorManager.get(config);
    if (initialInterceptor != null) {
      interceptors.add(initialInterceptor);
    } */
  }

  /// Listens to error states and invokes the provided [onErrorStatus]
  /// callback when an error occurs.
  ///
  /// The [onErrorStatus] callback is called with the error status code,
  /// which is an [int] value representing the HTTP status code.
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          onErrorStatus(e.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(e);
        },
      ),
    );
  }
}
