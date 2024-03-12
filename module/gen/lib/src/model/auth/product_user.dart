import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'product_user.g.dart';

@JsonSerializable()

/// [ProductUser] is a model for user.
/// This model is used for auth.
class ProductUser extends INetworkModel<ProductUser> with EquatableMixin {
  /// constructor
  ProductUser({
    this.userId,
    this.token,
    this.refreshToken,
    this.firebaseToken,
  });

  /// Represents an empty [ProductUser].
  ///
  /// This class is used to create an instance of [ProductUser] with empty
  /// values.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// ProductUser.empty();
  /// ```
  ///
  /// See also:
  ///
  /// - [ProductUser], the model class representing a product user.
  ///
  /// FILEPATH: /Users/gorsentam/Desktop/Movitty/dev/app/movitty/module/gen/lib/src/model/auth/product_user.dart
  ProductUser.empty();

  factory ProductUser.fromJson(Map<String, dynamic> json) =>
      _$ProductUserFromJson(json);

  @override

  /// The constructor for create [ProductUser] from json.
  ProductUser fromJson(Map<String, dynamic> json) {
    return _$ProductUserFromJson(json);
  }

  /// [userId] is an ID using for auth.
  String? userId;

  /// [token] is a token using for auth.
  String? token;

  /// [refreshToken] is a refresh token using for auth.
  String? refreshToken;

  /// [firebaseToken] is a firebase token using for auth.
  String? firebaseToken;

  @override
  List<Object?> get props => [userId, token, refreshToken, firebaseToken];

  /// The method for create json from [ProductUser].
  @override
  Map<String, dynamic> toJson() => _$ProductUserToJson(this);

  /// The method for create [ProductUser] from json.
  ProductUser copyWith({
    String? userId,
    String? token,
    String? refreshToken,
    String? firebaseToken,
  }) {
    return ProductUser(
      userId: userId ?? this.userId,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      firebaseToken: firebaseToken ?? this.firebaseToken,
    );
  }
}
