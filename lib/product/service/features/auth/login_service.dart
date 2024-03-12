// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/service/interface/index.dart';
import 'package:flutter_modular_mvvm/product/service/manager/product_service_path.dart';
import 'package:flutter_modular_mvvm/product/service/manager/product_service_warning_manager.dart';
import 'package:vexana/vexana.dart';

final class LoginService extends AuthenticationOperation {
  LoginService(INetworkManager<EmptyModel> networkManager)
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<List<User>> users() async {
    final response = await _networkManager.send<User, List<User>>(
      ProductServicePath.posts.value,
      parseModel: User(),
      method: RequestType.GET,
    );

    return response.data ?? [];
  }

  @override
  Future<ProductUser> login({
    required String username,
    required String password,
    required String firebaseToken,
  }) async {
    final response = await _networkManager
        .send<BaseResponseModel<ProductUser>, BaseResponseModel<ProductUser>>(
      ProductServicePath.login.value,
      parseModel: BaseResponseModel<ProductUser>(data: ProductUser()),
      method: RequestType.POST,
      onReceiveProgress: (progress, total) {
        log('progress: $progress, total: $total', name: 'LoginService.login');
      },
      data: {
        'username': username,
        'password': password,
        'firebase_token': firebaseToken,
      },
    );
    warningManager.handleResponse(response.data, type: NetworkHandleType.both);
    log(
      'SUCCESS: ${response.data?.success}',
      name: 'LoginService.login',
    );
    log(
      'MESSAGE: ${response.data?.message}',
      name: 'LoginService.login',
    );
    log(
      'DATA-Object: ${response.data}',
      name: 'LoginService.login',
    );
    log(
      'DATA-Object2: ${response.data?.data}',
      name: 'LoginService.login',
    );
    log(
      'ERROR-StatusCode: ${response.error?.statusCode}',
      name: 'LoginService.login',
    );
    log(
      'ERROR-Description: ${response.error?.description}',
      name: 'LoginService.login',
    );

    if (response.error?.statusCode == null && response.data?.data != null) {
      return response.data!.data!;
    } else {
      throw Exception(response.error?.description ?? response.data?.message);
    }
  }

  @override
  Future<BaseResponseModel> signUp({
    required String username,
    required String password,
    required String email,
    required String passwordConfirmation,
    required int agreement,
  }) {
    throw UnimplementedError();
  }
}
