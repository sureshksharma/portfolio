import 'package:json_annotation/json_annotation.dart';

import 'category.model.dart';

part 'subcategory.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SubcategoryModel {
  int? id;
  String? name;
  CategoryModel? category;
  String? desc;
  int? products;
  int? status;
  String? createdAt;
  String? updatedAt;

  SubcategoryModel({
    this.id,
    this.name,
    this.category,
    this.desc,
    this.products,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  /// Helper methods for genericArgumentFactories
  static SubcategoryModel fromJsonModel(Object? json) =>
      SubcategoryModel.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(SubcategoryModel order) =>
      order.toJson();

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryModelToJson(this);

  SubcategoryModel copyWith({
    int? id,
    String? name,
    CategoryModel? category,
    String? desc,
    int? products,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return SubcategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      desc: desc ?? this.desc,
      products: products ?? this.products,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
