import 'package:get_storage/get_storage.dart';

abstract class IStorage {
  GetStorage get storage;

  Future<void> write({required String key, required dynamic value});
  T? read<T>(String key);
}