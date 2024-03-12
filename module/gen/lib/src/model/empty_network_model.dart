import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'empty_network_model.g.dart';

@JsonSerializable()

/// Represents a model for an empty network response.
///
/// This model is used when the network response does not contain any data.
/// It implements the [INetworkModel] interface and the [EquatableMixin] for
/// equality comparison.
///
/// The [EmptyNetworkModel] has a nullable [data] property that holds the
/// response data.
///
/// It provides methods to convert the model to and from JSON format.
///
/// Example usage:
/// ```dart
/// EmptyNetworkModel emptyModel = EmptyNetworkModel.empty();
/// ```
class EmptyNetworkModel extends INetworkModel<EmptyNetworkModel>
    with EquatableMixin {
  /// Creates a new instance of [EmptyNetworkModel].
  ///
  /// [data] is the optional data associated with the empty network response.
  EmptyNetworkModel({this.data});

  /// Creates an instance of [EmptyNetworkModel].
  EmptyNetworkModel.empty();

  /// Creates an instance of [EmptyNetworkModel] from JSON data.
  Map<String, dynamic>? data;

  @override
  EmptyNetworkModel fromJson(Map<String, dynamic> json) =>
      _$EmptyNetworkModelFromJson(json);

  @override
  List<Object?> get props => [data];

  @override
  Map<String, dynamic>? toJson() => _$EmptyNetworkModelToJson(this);

  /// Creates a copy of [EmptyNetworkModel] with the given properties.
  EmptyNetworkModel copyWith({
    Map<String, dynamic>? data,
  }) {
    return EmptyNetworkModel(
      data: data ?? this.data,
    );
  }
}
