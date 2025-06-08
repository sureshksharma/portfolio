// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) => RegionModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      country: (json['country'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'country': instance.country,
      'status': instance.status,
    };
