import 'package:dio/src/response.dart';
import 'package:flutter_modular_mvvm/product/service/manager/token_manager.dart';
import 'package:vexana/vexana.dart';

/// A class that implements the Interceptor interface for production environment.
class ProdInterceptor implements Interceptor {
  RequestOptions? lastRequestOptions;
  bool tryLimiterOn = false;

  /// Constructor for ProdInterceptor
  ProdInterceptor(this._tokenManager);

  final TokenManager _tokenManager;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    lastRequestOptions = options;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    Response res = response;
    res = await _tokenManager.tokenAuthorizer(
      response: response,
      options: lastRequestOptions,
    );
    return handler.next(res);
    /* if (!tryLimiterOn) {
      res = await _tokenManager.tokenAuthorizer(
        response: response,
        options: lastRequestOptions,
      );
      tryLimiterOn = true;
      return handler.next(res);
    } */
  }
}
