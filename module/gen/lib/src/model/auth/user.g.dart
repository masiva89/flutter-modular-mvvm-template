// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['userId'] as int?,
      role: json['role'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      credit: json['credit'] as int?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: json['gender'] == null
          ? null
          : Gender.fromJson(json['gender'] as Map<String, dynamic>),
      gdprEnabled: json['gdprEnabled'] as bool?,
      marketingEnabled: json['marketingEnabled'] as bool?,
      mobileNotificationEnabled: json['mobileNotificationEnabled'] as bool?,
      emailNotificationEnabled: json['emailNotificationEnabled'] as bool?,
      smsNotificationEnabled: json['smsNotificationEnabled'] as bool?,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'role': instance.role,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'credit': instance.credit,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': instance.gender,
      'gdprEnabled': instance.gdprEnabled,
      'marketingEnabled': instance.marketingEnabled,
      'mobileNotificationEnabled': instance.mobileNotificationEnabled,
      'emailNotificationEnabled': instance.emailNotificationEnabled,
      'smsNotificationEnabled': instance.smsNotificationEnabled,
      'countryCode': instance.countryCode,
    };
