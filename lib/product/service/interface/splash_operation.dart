import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/service/interface/operation_base.dart';

/// This abstract class represents the interface for performing splash operations.
/// It extends the [OperationBase] class and defines a method to get the version.
abstract class SplashOperation extends OperationBase {
  /// Retrieves the version information.
  Future<AppVersion> getVersion();
}
