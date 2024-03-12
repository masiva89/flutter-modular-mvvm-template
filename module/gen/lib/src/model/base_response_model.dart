import 'package:vexana/vexana.dart';

/// Represents a base response model for network requests.
///
/// The [BaseResponseModel] class is a generic class that represents the response
/// received from a network request. It contains information about the success
/// status of the request, a message associated with the request, and the parsed
/// network model.
///
/// Example usage:
/// ```dart
/// BaseResponseModel<ProductUser> response = BaseResponseModel<ProductUser>(
///   success: true,
///   message: 'Success',
///   data: ProductUser.empty(),
/// );
/// ```
class BaseResponseModel<T extends INetworkModel<T>>
    extends INetworkModel<BaseResponseModel<T>> {
  /// Creates a new instance of [BaseResponseModel].
  ///
  /// [success] is the success status of the network request.
  /// [message] is the message of the network request.
  /// [data] is the parsed network model.
  ///
  /// Example usage:
  /// ```dart
  /// BaseResponseModel<ProductUser> response = BaseResponseModel<ProductUser>(
  ///   success: 1,
  ///   message: 'Success',
  ///   data: ProductUser.empty(),
  /// );
  /// ```
  BaseResponseModel({this.data, this.success, this.message});

  /// Creates an instance of [BaseResponseModel].
  BaseResponseModel.empty();

  /// The success status of the network request.
  int? success;

  /// The message of the network request.
  String? message;

  /// The parsed network model.
  T? data;

  @override
  BaseResponseModel<T> fromJson(Map<String, dynamic> json) {
    return BaseResponseModel<T>(
      success: json['success'] as int?,
      message: json['message'] as String?,
      data: data?.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic>? toJson() {
    return <String, dynamic>{
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}
