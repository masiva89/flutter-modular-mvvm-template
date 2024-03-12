import 'dart:developer';

import 'package:dio/src/response.dart';
import 'package:flutter_modular_mvvm/product/service/mock/mock_response_loader.dart';
import 'package:flutter_modular_mvvm/product/service/mock/mock_response_type.dart';
import 'package:flutter_modular_mvvm/product/widget/alert/project_snackbar.dart';
import 'package:vexana/vexana.dart';

/// A mock interceptor that implements the [Interceptor] interface.
class MockInterceptor implements Interceptor {
  final _jsonDir = 'assets/mock/';

  final _responseType = MockResponseType.success;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ProjectSnackbar(
      message: 'Beklenmedik bir hata oluştu.',
      type: ProjectSnackbarType.error,
    ).show();
    handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log('--------------------------------------------');
    log('MockInterceptor.onRequest [URI]: ${options.uri}');
    log('MockInterceptor.onRequest [METHOD]: ${options.method}');
    log('MockInterceptor.onRequest [DATA]: ${options.data}');
    log('MockInterceptor.onRequest [HEADERS]: ${options.headers}');
    log('MockInterceptor.onRequest [PATH]: ${options.path}');
    log('--------------------------------------------');
    final urlPath = options.path.replaceAll('/', '_');
    final resourcePath = _jsonDir + urlPath;
    final mockResponse = await MockResponseLoader.loadResponse(
      path: resourcePath,
      responseType: _responseType,
    );
    if (_responseType == MockResponseType.success) {
      handler.resolve(mockResponse);
    } else {
      handler.reject(
        DioException.badResponse(
          statusCode: 400,
          requestOptions: options,
          response: mockResponse,
        ),
        true,
      );
    }
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {}
}
