// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductUser _$ProductUserFromJson(Map<String, dynamic> json) => ProductUser(
      userId: json['userId'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      firebaseToken: json['firebaseToken'] as String?,
    );

Map<String, dynamic> _$ProductUserToJson(ProductUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'firebaseToken': instance.firebaseToken,
    };
