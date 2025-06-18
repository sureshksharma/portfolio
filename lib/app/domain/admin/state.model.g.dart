// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateModel _$StateModelFromJson(Map<String, dynamic> json) => StateModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      country: (json['country'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'country': instance.country,
      'status': instance.status,
    };
