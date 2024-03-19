import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'refresh_token.g.dart';

@JsonSerializable()
final class RefreshToken extends INetworkModel<RefreshToken>
    with EquatableMixin {
  RefreshToken({
    this.auth,
  });

  factory RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenFromJson(json);

  final Auth? auth;

  @override
  List<Object?> get props => [auth];

  @override
  Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);

  @override
  RefreshToken fromJson(Map<String, dynamic> json) {
    return _$RefreshTokenFromJson(json);
  }

  RefreshToken copyWith({
    Auth? auth,
  }) {
    return RefreshToken(
      auth: auth ?? this.auth,
    );
  }
}
