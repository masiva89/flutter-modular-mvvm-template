// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth(
      sessionId: json['sessionId'] as int?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      refreshTokenExpiresAt: json['refreshTokenExpiresAt'] == null
          ? null
          : DateTime.parse(json['refreshTokenExpiresAt'] as String),
      accessTokenExpiresAt: json['accessTokenExpiresAt'] == null
          ? null
          : DateTime.parse(json['accessTokenExpiresAt'] as String),
    );

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'sessionId': instance.sessionId,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiresAt':
          instance.refreshTokenExpiresAt?.toIso8601String(),
      'accessTokenExpiresAt': instance.accessTokenExpiresAt?.toIso8601String(),
    };
