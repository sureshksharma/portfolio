import 'package:json_annotation/json_annotation.dart';

import 'subcategory.model.dart';
import 'type.model.dart';

part 'product.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductModel {
  int? id;
  String? name;
  SubcategoryModel? category;
  TypeModel? type;
  String? desc;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  ProductModel({
    this.id,
    this.name,
    this.category,
    this.type,
    this.desc,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductModel copyWith({
    int? id,
    String? name,
    SubcategoryModel? category,
    TypeModel? type,
    String? desc,
    String? image,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      type: type ?? this.type,
      desc: desc ?? this.desc,
      image: image ?? this.image,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
