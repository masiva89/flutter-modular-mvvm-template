import 'package:vexana/vexana.dart';

/// A mixin that provides basic network functionality for a model.
///
/// This mixin is intended to be used with classes that implement the
/// [INetworkModel] interface. It adds two optional properties, [statusCode]
/// and [message], which can be used to store information about the
/// network response.
mixin NetworkBaseMixin<T> on INetworkModel<T> {
  /// The status code of the network response.
  String? statusCode = '';

  /// The message of the network response.
  String? message = '';
}
