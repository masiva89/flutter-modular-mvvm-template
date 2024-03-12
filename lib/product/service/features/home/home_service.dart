/* import 'dart:developer';

import 'package:gen/src/index.dart'
    show BaseResponseModel, Header, HomeSections;
import 'package:flutter_modular_mvvm/product/service/index.dart';
import 'package:flutter_modular_mvvm/product/service/interface/home_operation.dart';
import 'package:vexana/vexana.dart';

/// This class represents the service for the home feature in the Movitty app.
/// It extends the [HomeOperation] class.
class HomeService extends HomeOperation {
  /// Creates a new instance of the [HomeService] class.
  ///
  /// The [networkManager] parameter is required.
  HomeService(INetworkManager<EmptyModel> networkManager)
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<Header> homeHeader() async {
    final response = await _networkManager
        .send<BaseResponseModel<Header>, BaseResponseModel<Header>>(
      ProductServicePath.homeHeader.value,
      parseModel: BaseResponseModel<Header>(data: Header()),
      method: RequestType.POST,
      onReceiveProgress: (progress, total) {
        log('progress: $progress, total: $total', name: 'HomeService.header');
      },
      data: {
        'user_id': 'user id',
        'language': 'language',
        'region': 'region',
      },
    );
    warningManager.handleResponse(response.data);
    log(
      'SUCCESS: ${response.data?.success}',
      name: 'HomeService.header',
    );
    log(
      'MESSAGE: ${response.data?.message}',
      name: 'HomeService.header',
    );
    log(
      'DATA-Object: ${response.data}',
      name: 'HomeService.header',
    );
    log(
      'DATA-Object2: ${response.data?.data}',
      name: 'HomeService.header',
    );
    log(
      'ERROR-StatusCode: ${response.error?.statusCode}',
      name: 'HomeService.header',
    );
    log(
      'ERROR-Description: ${response.error?.description}',
      name: 'HomeService.header',
    );

    if (response.error?.statusCode == null && response.data?.data != null) {
      return response.data!.data!;
    } else {
      throw Exception(response.error?.description ?? response.data?.message);
    }
  }

  @override
  Future<HomeSections> homeSections() async {
    final response = await _networkManager
        .send<BaseResponseModel<HomeSections>, BaseResponseModel<HomeSections>>(
      ProductServicePath.homeSections.value,
      parseModel: BaseResponseModel<HomeSections>(data: HomeSections()),
      method: RequestType.POST,
      onReceiveProgress: (progress, total) {
        log('progress: $progress, total: $total', name: 'HomeService.sections');
      },
      data: {
        'user_id': 'user id',
        'language': 'language',
        'region': 'region',
      },
    );
    warningManager.handleResponse(response.data);
    log(
      'SUCCESS: ${response.data?.success}',
      name: 'HomeService.sections',
    );
    log(
      'MESSAGE: ${response.data?.message}',
      name: 'HomeService.sections',
    );
    log(
      'DATA-Object: ${response.data}',
      name: 'HomeService.sections',
    );
    log(
      'DATA-Object2: ${response.data?.data}',
      name: 'HomeService.sections',
    );
    log(
      'ERROR-StatusCode: ${response.error?.statusCode}',
      name: 'HomeService.sections',
    );
    log(
      'ERROR-Description: ${response.error?.description}',
      name: 'HomeService.sections',
    );

    if (response.error?.statusCode == null && response.data?.data != null) {
      return response.data!.data!;
    } else {
      throw Exception(response.error?.description ?? response.data?.message);
    }
  }
}
 */