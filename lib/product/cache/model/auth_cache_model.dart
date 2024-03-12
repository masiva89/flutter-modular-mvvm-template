import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_modular_mvvm/product/cache/path/cache_path.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/enum/user_status.dart';

/// [AuthCacheModel] is a cache model for auth.
final class AuthCacheModel with CacheModel {
  /// constructor
  AuthCacheModel({required this.productUser});

  /// Empty constructor
  AuthCacheModel.empty() : productUser = ProductUser();

  /// [productUser] is a productUser model.
  final ProductUser productUser;

  @override
  AuthCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<ProductUser>('Json cannot be null');
      return this;
    }
    return copyWith(
      productUser: ProductUser.fromJson(jsonMap),
    );
  }

  @override
  String get id => CachePath.auth.value;

  @override
  Map<String, dynamic> toJson() => productUser.toJson();

  /// [copyWith] is a method to copy with.
  AuthCacheModel copyWith({
    ProductUser? productUser,
  }) {
    return AuthCacheModel(
      productUser: productUser ?? this.productUser,
    );
  }

  /// [userStatus] is a user status.
  /// If user id is null or empty, user status is not logged in.
  UserStatus get userStatus {
    if (productUser.userId.ext.isNullOrEmpty) {
      return UserStatus.notLoggedIn;
    } else {
      return UserStatus.loggedIn;
    }
  }
}
