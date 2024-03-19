import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter_modular_mvvm/product/cache/index.dart';
import 'package:flutter_modular_mvvm/product/service/index.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';
import 'package:dio/src/response.dart';
import 'package:dio/src/dio.dart' as dio;

import '../../state/index.dart';

/// A singleton class that manages the token authorization for network requests.
class TokenManager {
  /// Constructor for TokenManager
  TokenManager({
    required INetworkManager<EmptyModel> networkManager,
    required CacheOperation<AuthCacheModel> authCacheOperation,
    required dio.Dio dio,
  })  : _networkManager = networkManager,
        _authCacheOperation = authCacheOperation,
        _dio = dio;

  final INetworkManager<EmptyModel> _networkManager;

  final CacheOperation<AuthCacheModel> _authCacheOperation;

  final dio.Dio _dio;

  /// Authorizes the token for a given response and options.
  ///
  /// If the response status code is not [HttpStatus.unauthorized], the response
  /// is returned as is. Otherwise, the token is refreshed and the request is
  /// repeated with the new token.
  Future<Response> tokenAuthorizer({
    required Response response,
    RequestOptions? options,
  }) async {
    print('TokenManager.tokenAuthorizer');
    if (options == null) return response;
    final statusCode = response.statusCode;
    if (statusCode != 401) return response;

    final authCacheModel = _authCacheOperation.get(CachePath.auth.value);
    final newToken = await _refreshToken(authCacheModel?.auth.refreshToken);
    _authCacheOperation.add(AuthCacheModel(auth: newToken));
    return await _repeatRequestWithNewToken(
      options: options,
      newAccessToken: newToken.accessToken!,
    );
  }

  /// Refreshes the token using the provided refresh token.
  ///
  /// Returns the new token after refreshing.
  Future<Auth> _refreshToken(String? refreshToken) async {
    final response = await _networkManager
        .send<BaseResponseModel<Auth>, BaseResponseModel<Auth>>(
      ProductServicePath.refreshToken.value,
      parseModel: BaseResponseModel<Auth>(data: Auth()),
      method: RequestType.POST,
      data: {
        'refreshToken': refreshToken,
      },
    );
    return response.data!.data!;
  }

  /// Repeats the request with the new access token.
  ///
  /// Updates the 'Authorization' header with the new access token and fetches
  /// the request using Dio.
  Future<Response> _repeatRequestWithNewToken({
    required RequestOptions options,
    required String newAccessToken,
  }) async {
    options.headers['Authorization'] = 'Bearer $newAccessToken';
    return await _dio.fetch(options);
  }
}
