import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../data/constants/storage.constants.dart';
import '../../../data/interfaces/storage.interface.dart';

part 'user.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? token;
  String? avatar;

  UserModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.token,
    this.avatar,
  });

  static UserModel? fromStorage() {
    final storage = Get.find<IStorage>();
    final user = storage.read(StorageConstants.user);
    final userModel = user != null ? UserModel.fromJson(user) : null;
    return userModel;
  }

  Future<void> save() async {
    final storage = Get.find<IStorage>();
    await storage.write(
      key: StorageConstants.user,
      value: toJson(),
    );
  }

  static Future<void> clear() async {
    final storage = Get.find<IStorage>();
    await storage.write(
      key: StorageConstants.user,
      value: null,
    );
  }

  /// Helper methods for genericArgumentFactories
  static UserModel fromJsonModel(Object? json) =>
      UserModel.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(UserModel order) => order.toJson();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? token,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      token: token ?? this.token,
      avatar: avatar ?? this.avatar,
    );
  }
}
