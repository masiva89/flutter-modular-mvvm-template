import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'auth.g.dart';

@JsonSerializable()
final class Auth extends INetworkModel<Auth> with EquatableMixin {
  Auth({
    this.sessionId,
    this.accessToken,
    this.refreshToken,
    this.refreshTokenExpiresAt,
    this.accessTokenExpiresAt,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  final int? sessionId;
  final String? accessToken;
  final String? refreshToken;
  final DateTime? refreshTokenExpiresAt;
  final DateTime? accessTokenExpiresAt;

  @override
  List<Object?> get props => [
        sessionId,
        accessToken,
        refreshToken,
        refreshTokenExpiresAt,
        accessTokenExpiresAt,
      ];

  @override
  Map<String, dynamic> toJson() => _$AuthToJson(this);

  @override
  Auth fromJson(Map<String, dynamic> json) {
    return _$AuthFromJson(json);
  }

  Auth copyWith({
    int? sessionId,
    String? accessToken,
    String? refreshToken,
    DateTime? refreshTokenExpiresAt,
    DateTime? accessTokenExpiresAt,
  }) {
    return Auth(
      sessionId: sessionId ?? this.sessionId,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      refreshTokenExpiresAt:
          refreshTokenExpiresAt ?? this.refreshTokenExpiresAt,
      accessTokenExpiresAt: accessTokenExpiresAt ?? this.accessTokenExpiresAt,
    );
  }
}
