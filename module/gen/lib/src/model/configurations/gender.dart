import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'gender.g.dart';

@JsonSerializable()
class Gender extends INetworkModel<Gender> with EquatableMixin {
  Gender({
    this.id,
    this.name,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);

  final int? id;
  final String? name;

  @override
  List<Object?> get props => [id, name];

  @override
  Map<String, dynamic> toJson() => _$GenderToJson(this);

  @override
  Gender fromJson(Map<String, dynamic> json) {
    return _$GenderFromJson(json);
  }

  Gender copyWith({
    int? id,
    String? name,
  }) {
    return Gender(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
