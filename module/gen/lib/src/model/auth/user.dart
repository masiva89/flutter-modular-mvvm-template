// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:gen/src/model/configurations/gender.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends INetworkModel<User> with EquatableMixin {
  User({
    this.userId,
    this.role,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.credit,
    this.birthDate,
    this.gender,
    this.gdprEnabled,
    this.marketingEnabled,
    this.mobileNotificationEnabled,
    this.emailNotificationEnabled,
    this.smsNotificationEnabled,
    this.countryCode,
  });

  /// Get user from json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  final int? userId;
  final String? role;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final int? credit;
  final DateTime? birthDate;
  final Gender? gender;
  final bool? gdprEnabled;
  final bool? marketingEnabled;
  final bool? mobileNotificationEnabled;
  final bool? emailNotificationEnabled;
  final bool? smsNotificationEnabled;
  final String? countryCode;

  @override
  List<Object?> get props => [
        userId,
        role,
        username,
        email,
        firstName,
        lastName,
        credit,
        birthDate,
        gender,
        gdprEnabled,
        marketingEnabled,
        mobileNotificationEnabled,
        emailNotificationEnabled,
        smsNotificationEnabled,
        countryCode,
      ];

  /// User model to map object
  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  User fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  User copyWith({
    int? userId,
    String? role,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    int? credit,
    DateTime? birthDate,
    Gender? gender,
    bool? gdprEnabled,
    bool? marketingEnabled,
    bool? mobileNotificationEnabled,
    bool? emailNotificationEnabled,
    bool? smsNotificationEnabled,
    String? countryCode,
  }) {
    return User(
      userId: userId ?? this.userId,
      role: role ?? this.role,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      credit: credit ?? this.credit,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      gdprEnabled: gdprEnabled ?? this.gdprEnabled,
      marketingEnabled: marketingEnabled ?? this.marketingEnabled,
      mobileNotificationEnabled:
          mobileNotificationEnabled ?? this.mobileNotificationEnabled,
      emailNotificationEnabled:
          emailNotificationEnabled ?? this.emailNotificationEnabled,
      smsNotificationEnabled:
          smsNotificationEnabled ?? this.smsNotificationEnabled,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
