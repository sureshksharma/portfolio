import 'package:json_annotation/json_annotation.dart';

part 'category.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoryModel {
  int? id;
  String? name;
  int? subcategories;
  String? desc;
  int? status;
  String? createdAt;
  String? updatedAt;

  CategoryModel({
    this.id,
    this.name,
    this.subcategories,
    this.desc,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  /// Helper methods for genericArgumentFactories
  static CategoryModel fromJsonModel(Object? json) =>
      CategoryModel.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(CategoryModel order) =>
      order.toJson();

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  CategoryModel copyWith({
    int? id,
    String? name,
    int? subcategories,
    String? desc,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      subcategories: subcategories ?? this.subcategories,
      desc: desc ?? this.desc,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
