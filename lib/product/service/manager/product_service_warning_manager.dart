import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/widget/alert/project_snackbar.dart';

/// Enum representing the type of network handle.
///
/// The [NetworkHandleType] enum is used to specify the type of network handle
/// for a service manager in the Movitty application.
///
/// The possible values are:
///
/// - [NetworkHandleType.onlyError]: Indicates that only error responses should
/// be handled.
///
/// - [NetworkHandleType.onlySuccess]: Indicates that only success responses
/// should be handled.
///
/// - [NetworkHandleType.both]: Indicates that both error and success responses
/// should be handled.
enum NetworkHandleType {
  /// Indicates that only error responses should be handled.
  onlyError,

  /// Indicates that only success responses should be handled.
  onlySuccess,

  /// Indicates that both error and success responses should be handled.
  both,

  /// Indicates that no responses should be handled.
  none,
}

/// A manager class for handling warnings in the product service.
///
/// This class provides a singleton instance of [ProductServiceWarningManager]
/// and handles error responses from the server.
class ProductServiceWarningManager {
  ProductServiceWarningManager._();

  static ProductServiceWarningManager? _instance;

  /// Returns the singleton instance of [ProductServiceWarningManager].
  static ProductServiceWarningManager get instance {
    _instance ??= ProductServiceWarningManager._();
    return _instance!;
  }

  /// The error message to be shown when the response model is null.
  final nullErrorMessage = 'Beklenmedik bir hata oluştu.';

  /// The success message to be shown when the response model is null.
  final nullSuccessMessage = 'İşlem başarıyla gerçekleştirildi.';

  /// Handles the response model. The [handleResponse] method handles the
  /// response model and shows a [ProjectSnackbar] based on the [type]
  /// parameter.
  ///
  /// The [responseModel] parameter is the response model to be handled.
  ///
  /// The [type] parameter is the type of network handle.
  /// The default value is [NetworkHandleType.onlyError].
  ///
  /// The possible values are:
  ///
  /// - [NetworkHandleType.onlyError]: Indicates that only error responses should
  /// be handled.
  ///
  /// - [NetworkHandleType.onlySuccess]: Indicates that only success responses
  /// should be handled.
  ///
  /// - [NetworkHandleType.both]: Indicates that both error and success responses
  /// should be handled.
  void handleResponse(
    BaseResponseModel? responseModel, {
    NetworkHandleType type = NetworkHandleType.onlyError,
  }) {
    if (responseModel == null) return;
    final hasError = responseModel.success != 1;
    final message = responseModel.message ??
        (hasError ? nullErrorMessage : nullSuccessMessage);
    ProjectSnackbar? snackbar;
    switch (type) {
      case NetworkHandleType.onlyError:
        if (hasError) {
          snackbar = ProjectSnackbar(
            message: message,
            type: ProjectSnackbarType.error,
            duration: const Duration(seconds: 5),
          );
        }
      case NetworkHandleType.onlySuccess:
        if (!hasError) {
          snackbar = ProjectSnackbar(
            message: message,
            type: ProjectSnackbarType.success,
            duration: const Duration(seconds: 5),
          );
        }
      case NetworkHandleType.both:
        snackbar = ProjectSnackbar(
          message: message,
          type: hasError
              ? ProjectSnackbarType.error
              : ProjectSnackbarType.success,
          duration: const Duration(seconds: 5),
        );
      case NetworkHandleType.none:
        break;
    }
    if (snackbar != null) snackbar.show();
  }
}
