import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'app_version.g.dart';

@JsonSerializable()

/// Represents the version information of the application.
///
/// This class is used to deserialize JSON data into an [AppVersion] object
/// and serialize an [AppVersion] object into JSON data.
///
/// The [version] property represents the version number of the application.
class AppVersion extends INetworkModel<AppVersion> with EquatableMixin {
  /// Creates a new instance of [AppVersion].
  ///
  /// The [version] parameter represents the version number of the application.
  AppVersion({this.minVersion, this.maxVersion});

  /// Creates a new instance of [AppVersion] from a JSON map.
  factory AppVersion.fromJson(Map<String, dynamic> json) =>
      _$AppVersionFromJson(json);

  /// Creates a new instance of [AppVersion] from a JSON map.
  AppVersion.empty();

  /// The version number of the application.
  String? minVersion;
  String? maxVersion;

  @override
  AppVersion fromJson(Map<String, dynamic> json) {
    return _$AppVersionFromJson(json);
  }

  @override
  List<Object?> get props => [minVersion, maxVersion];

  @override
  Map<String, dynamic>? toJson() {
    return _$AppVersionToJson(this);
  }
}
