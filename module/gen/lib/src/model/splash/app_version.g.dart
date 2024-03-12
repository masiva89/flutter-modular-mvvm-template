// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppVersion _$AppVersionFromJson(Map<String, dynamic> json) => AppVersion(
      minVersion: json['minVersion'] as String?,
      maxVersion: json['maxVersion'] as String?,
    );

Map<String, dynamic> _$AppVersionToJson(AppVersion instance) =>
    <String, dynamic>{
      'minVersion': instance.minVersion,
      'maxVersion': instance.maxVersion,
    };
