// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      subcategories: (json['subcategories'] as num?)?.toInt(),
      desc: json['desc'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subcategories': instance.subcategories,
      'desc': instance.desc,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
