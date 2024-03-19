import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/cache/index.dart';
import 'package:flutter_modular_mvvm/product/service/interceptor/mock_interceptor.dart';
import 'package:flutter_modular_mvvm/product/service/interceptor/prod_interceptor.dart';
import 'package:flutter_modular_mvvm/product/service/manager/token_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vexana/vexana.dart';
import 'package:dio/dio.dart' as dio;

@GenerateNiceMocks([
  MockSpec<dio.Dio>(),
  MockSpec<INetworkManager<EmptyModel>>(),
  MockSpec<CacheOperation<AuthCacheModel>>(),
])
import 'refresh_token_test.mocks.dart';

void main() {
  late TokenManager tokenManager;
  late INetworkManager<EmptyModel> networkManager;
  late CacheOperation<AuthCacheModel> authCacheOperation;
  late dio.Dio dioke;

  late MockInterceptor sut;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    dioke = dio.Dio();
    networkManager = MockINetworkManager();
    authCacheOperation = MockCacheOperation();
    tokenManager = TokenManager(
      networkManager: networkManager,
      authCacheOperation: authCacheOperation,
      dio: dioke,
    );
    sut = MockInterceptor(tokenManager);
  });
  test('Refresh Token', () async {
    /* dio.Response failureRes = dio.Response(
      requestOptions: dio.RequestOptions(path: 'path'),
      statusCode: 401,
      data: {"id": "1"},
    ); */

    dioke.interceptors.add(sut);
    await dioke.get('https://www.lipsum.com');
    /* when(tokenManager.tokenAuthorizer(
      response: failureRes,
      options: failureRes.requestOptions,
    )).thenAnswer((_) async {
      return await Future.value(dio.Response(
        requestOptions: dio.RequestOptions(path: 'path'),
        statusCode: 200,
      ));
    }); */
    verify(tokenManager.tokenAuthorizer).called(1);
    /* final response = Response(
        requestOptions: RequestOptions(path: 'path'),
        statusCode: HttpStatus.unauthorized,
      );
      final options = RequestOptions(path: 'path');
      final authCacheModel = AuthCacheModel(auth: Auth());
      final newToken = Auth();
      final newAccessToken = 'newAccessToken';
      final newResponse = Response(
        requestOptions: RequestOptions(path: 'path'),
        statusCode: HttpStatus.ok,
      );

      when(authCacheOperation.get(CachePath.auth.value))
          .thenReturn(authCacheModel);
      when(tokenManager._refreshToken(authCacheModel.auth.refreshToken))
          .thenAnswer((_) async => newToken);
      when(networkManager.send<BaseResponseModel<Auth>, BaseResponseModel<Auth>>(
        ProductServicePath.refreshToken.value,
        parseModel: BaseResponseModel<Auth>(data: Auth()),
        method: RequestType.POST,
        data: {
          'refreshToken': authCacheModel.auth.refreshToken,
        },
      )).thenAnswer((_) async => newResponse);
      when(tokenManager._repeatRequestWithNewToken(
        options: options,
        newAccessToken: newToken.accessToken!,
      )).thenAnswer((_) async => newResponse);

      final result = await sut.tokenAuthorizer(
        response: response,
        options: options,
      );

      expect(result, newResponse); */
  });
}
