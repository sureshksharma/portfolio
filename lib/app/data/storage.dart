import 'package:get_storage/get_storage.dart';

import 'interfaces/storage.interface.dart';

class Storage implements IStorage {
  @override
  final GetStorage storage;

  const Storage({required GetStorage getStorage}) : storage = getStorage;

  @override
  T? read<T>(String key) {
    return storage.read<T>(key);
  }

  @override
  Future<void> write({required String key, required value}) async {
    await storage.write(key, value);
  }
}