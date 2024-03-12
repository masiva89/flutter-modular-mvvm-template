import 'package:flutter_modular_mvvm/product/service/manager/product_service_warning_manager.dart';

/// This is the base class for all operations.
/// It provides a common interface for operations in the Movitty application.
abstract class OperationBase {
  /// The warning manager for the product service.
  /// It is used to manage warnings for the product service.
  ProductServiceWarningManager get warningManager =>
      ProductServiceWarningManager.instance;
}
