import 'package:core/core.dart';
import 'package:flutter_modular_mvvm/product/service/manager/index.dart';
import 'package:vexana/vexana.dart';

import '../../cache/index.dart';
import '../../state/index.dart';

final class TokenManager {
  // singleton class
  TokenManager._init();
  static final TokenManager _instance = TokenManager._init();
  factory TokenManager() {
    return _instance;
  }

  /* InterceptorsWrapper getTokenInterceptor(
      {required ProductNetworkManager networkManager}) {
    return InterceptorsWrapper(
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
          e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

          // Repeat the request with the updated header
          return handler.resolve(await super.fetch(e.requestOptions));
        }
        return handler.next(e);
      },
    );
  } */
}
