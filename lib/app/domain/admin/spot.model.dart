import 'package:json_annotation/json_annotation.dart';

import 'city.model.dart';
import 'region.model.dart';
import 'type.model.dart';

part 'spot.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpotModel {
  int? id;
  String? name;
  String? location;
  String? coordinates;
  TypeModel? type;
  String? desc;
  RegionModel? state;
  CityModel? city;
  int? status;

  SpotModel({
    this.id,
    this.name,
    this.location,
    this.coordinates,
    this.type,
    this.desc,
    this.state,
    this.city,
    this.status,
  });

  /// Helper methods for genericArgumentFactories
  static SpotModel fromJsonModel(Object? json) =>
      SpotModel.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(SpotModel order) => order.toJson();

  factory SpotModel.fromJson(Map<String, dynamic> json) =>
      _$SpotModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpotModelToJson(this);

  SpotModel copyWith({
    int? id,
    String? name,
    String? location,
    String? coordinates,
    TypeModel? type,
    String? desc,
    RegionModel? state,
    CityModel? city,
    int? status,
  }) {
    return SpotModel(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      coordinates: coordinates ?? this.coordinates,
      type: type ?? this.type,
      desc: desc ?? this.desc,
      state: state ?? this.state,
      city: city ?? this.city,
      status: status ?? this.status,
    );
  }
}
