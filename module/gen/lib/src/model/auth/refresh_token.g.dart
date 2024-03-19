// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshToken _$RefreshTokenFromJson(Map<String, dynamic> json) => RefreshToken(
      auth: json['auth'] == null
          ? null
          : Auth.fromJson(json['auth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RefreshTokenToJson(RefreshToken instance) =>
    <String, dynamic>{
      'auth': instance.auth,
    };
