import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../index.dart';

part 'login_response.g.dart';

@JsonSerializable()
final class LoginResponse extends INetworkModel<LoginResponse>
    with EquatableMixin {
  LoginResponse({
    this.auth,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  final Auth? auth;
  final User? user;

  @override
  List<Object?> get props => [auth, user];

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  LoginResponse fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  LoginResponse copyWith({
    Auth? auth,
    User? user,
  }) {
    return LoginResponse(
      auth: auth ?? this.auth,
      user: user ?? this.user,
    );
  }
}
