import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// [UserCacheModel] is a cache model for user.
final class UserCacheModel with CacheModel {
  /// constructor
  UserCacheModel({required this.user});

  /// Empty constructor
  UserCacheModel.empty() : user = User();

  /// [user] is a user model.
  final User user;

  @override
  UserCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<User>('Json cannot be null');
      return this;
    }
    return copyWith(
      user: User.fromJson(jsonMap),
    );
  }

  @override
  String get id => user.id.toString();

  @override
  Map<String, dynamic> toJson() {
    return user.toJson();
  }

  /// [copyWith] is a method to copy with.
  UserCacheModel copyWith({
    User? user,
  }) {
    return UserCacheModel(
      user: user ?? this.user,
    );
  }
}
