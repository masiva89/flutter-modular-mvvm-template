import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/service/index.dart';
import 'package:flutter_modular_mvvm/product/service/interface/splash_operation.dart';
import 'package:vexana/vexana.dart';

/// This class represents a service for the splash feature.
/// It extends the [SplashOperation] class and provides functionality for getting the version.
class SplashService extends SplashOperation {
  /// Creates a new instance of the [SplashService] class.
  ///
  /// The [networkManager] parameter is required.
  /// It is used for making network requests.
  SplashService(INetworkManager<EmptyModel> networkManager)
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<AppVersion> getVersion() async {
    final response = await _networkManager
        .send<BaseResponseModel<AppVersion>, BaseResponseModel<AppVersion>>(
      ProductServicePath.version.value,
      parseModel: BaseResponseModel<AppVersion>(data: AppVersion()),
      method: RequestType.GET,
    );
    warningManager.handleResponse(response.data);
    if (response.error?.statusCode == null && response.data?.success == 1) {
      return response.data!.data!;
    } else {
      throw Exception(response.error?.description ?? response.data?.message);
    }
  }
}
