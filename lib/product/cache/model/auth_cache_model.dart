import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_modular_mvvm/product/cache/path/cache_path.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/enum/user_status.dart';

/// [AuthCacheModel] is a cache model for auth.
final class AuthCacheModel with CacheModel {
  /// constructor
  AuthCacheModel({required this.auth});

  /// Empty constructor
  AuthCacheModel.empty() : auth = Auth();

  /// [auth] is a auth model.
  final Auth auth;

  @override
  AuthCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<Auth>('Json cannot be null');
      return this;
    }
    return copyWith(
      auth: Auth.fromJson(jsonMap),
    );
  }

  @override
  String get id => CachePath.auth.value;

  @override
  Map<String, dynamic> toJson() => auth.toJson();

  /// [copyWith] is a method to copy with.
  AuthCacheModel copyWith({
    Auth? auth,
  }) {
    return AuthCacheModel(
      auth: auth ?? this.auth,
    );
  }

  /// [userStatus] is a user status.
  /// If user id is null or empty, user status is not logged in.
  UserStatus get userStatus {
    if (auth.sessionId == null) {
      return UserStatus.notLoggedIn;
    } else {
      return UserStatus.loggedIn;
    }
  }
}
