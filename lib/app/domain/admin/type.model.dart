import 'package:json_annotation/json_annotation.dart';

part 'type.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TypeModel {
  int? id;
  String? name;

  TypeModel({
    this.id,
    this.name,
  });

  /// Helper methods for genericArgumentFactories
  static TypeModel fromJsonModel(Object? json) =>
      TypeModel.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(TypeModel order) => order.toJson();

  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      _$TypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeModelToJson(this);

  TypeModel copyWith({
    int? id,
    String? name,
  }) {
    return TypeModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
