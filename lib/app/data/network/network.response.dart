import 'package:json_annotation/json_annotation.dart';
part 'network.response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class NetworkResponse<T> {
  T? data;
  String? status;
  String? message;

  NetworkResponse({
    this.data,
    this.status,
    this.message,
  });

  factory NetworkResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$NetworkResponseFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$NetworkResponseToJson<T>(this, toJsonT);
}