// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      region: (json['region'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'region': instance.region,
      'status': instance.status,
    };
