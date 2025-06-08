// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotModel _$SpotModelFromJson(Map<String, dynamic> json) => SpotModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      location: json['location'] as String?,
      coordinates: json['coordinates'] as String?,
      type: json['type'] == null
          ? null
          : TypeModel.fromJson(json['type'] as Map<String, dynamic>),
      desc: json['desc'] as String?,
      state: json['state'] == null
          ? null
          : RegionModel.fromJson(json['state'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SpotModelToJson(SpotModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'coordinates': instance.coordinates,
      'type': instance.type,
      'desc': instance.desc,
      'state': instance.state,
      'city': instance.city,
      'status': instance.status,
    };
