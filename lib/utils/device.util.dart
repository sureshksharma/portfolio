import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../app/data/constants/storage.constants.dart';
import '../app/data/interfaces/storage.interface.dart';

abstract class DeviceUtil {
  Future<String> get deviceId;
}

class DeviceUtilImpl extends DeviceUtil {
  final DeviceInfoPlugin _deviceInfo;
  final IStorage _storage = Get.find<IStorage>();

  DeviceUtilImpl({required DeviceInfoPlugin deviceInfo})
      : _deviceInfo = deviceInfo;

  @override
  Future<String> get deviceId async {
    String deviceId = '';
    if (Platform.isIOS) {
      var iosDeviceInfo = await _deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await _deviceInfo.androidInfo;
      deviceId = androidDeviceInfo.id;
      Logger().d('DeviceUtil: $androidDeviceInfo');
    }

    Logger().d('DeviceUtil: $deviceId');
    await _storage.write(key: StorageConstants.deviceId, value: deviceId);
    return deviceId;
  }
}