import 'package:json_annotation/json_annotation.dart';

part 'state.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StateModel {
  int? id;
  String? title;
  int? country;
  int? status;

  StateModel({
    this.id,
    this.title,
    this.country,
    this.status,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);

  StateModel copyWith({
    int? id,
    String? title,
    int? country,
    int? status,
  }) {
    return StateModel(
      id: id ?? this.id,
      title: title ?? this.title,
      country: country ?? this.country,
      status: status ?? this.status,
    );
  }
}
