import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';


import 'app/data/constants/network.contants.dart';
import 'app/data/constants/storage.constants.dart';
import 'app/data/interfaces/storage.interface.dart';
import 'app/data/storage.dart';
import 'app/domain/auth/models/user.model.dart';
import 'app/modules/shared/controllers/loading_controller.dart';
import 'app/modules/shared/controllers/menu_controller.dart';
import 'app/routes/app_pages.dart';
import 'utils/device.util.dart';
import 'utils/network.util.dart';
import 'utils/snackbar.util.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await _initStorage();
      // await _initFirebase();
      // await _initFCM();
      await _initGetConnect();
      _initGlobalControllers();
      _initScreenPreference();
    } catch (err) {
      Logger().e('Initializer Error: ${err.toString()}');
    }
  }

  static void _initGlobalControllers() {
    // Initialize NetworkUtil
    InternetConnectionChecker connectionChecker =
        InternetConnectionChecker.createInstance();
    final networkUtil = NetworkUtilImpl(connectionChecker: connectionChecker);
    Get.put<NetworkUtil>(networkUtil);

    // Initialize Device info plugin
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final deviceUtil = DeviceUtilImpl(deviceInfo: deviceInfoPlugin);
    Get.put<DeviceUtil>(deviceUtil);

    // Initialize LoadingController globally
    final loading = LoadingController();
    Get.put(loading);
    // Initialize MenuController globally
    final menuController = MenuController();
    Get.put(menuController);
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
    Get.put<IStorage>(Storage(getStorage: GetStorage()));
  }

  // static Future<void> _initFirebase() async {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // }

  // static Future<void> _initFCM() async {
  //   final notificationService = Get.put(NotificationService());
  //   Get.put<FCMHelper>(FCMHelper(
  //       notificationService: notificationService,
  //       storage: Get.find<IStorage>()));
  // }

  static Future<void> _initGetConnect() async {
    final connect = GetConnect();
    connect.allowAutoSignedCert = true;
    final url = NetworkConstants.BASE_URL;
    connect.baseUrl = url;
    connect.timeout = const Duration(seconds: 30);
    connect.httpClient.maxAuthRetries = 0;

    connect.httpClient.addRequestModifier<dynamic>(
      (request) async {
        Logger().d('REQUEST_URL: ${request.url}');
        UserModel? user = UserModel.fromStorage();
        String? ipAddress = await Get.find<NetworkUtil>().ipAddress;
        String? deviceId = Get.find<IStorage>().read(StorageConstants.deviceId);
        if (user != null) {
          Logger().d('TOKEN: ${user.token}');
          Logger().d('USER_ID: ${user.id}');
          request.headers['user_id'] = user.id ?? '';
          request.headers['token'] = user.token ?? '';
          request.headers['ip_address'] = ipAddress ?? '';
          request.headers['device_id'] = deviceId ?? '';
          request.headers['latitude'] = '';
          request.headers['longitude'] = '';
          Logger().d('REQUEST_HEADERS: ${request.headers}');
        }

        return request;
      },
    );

    connect.httpClient.addResponseModifier<dynamic>(
      (request, response) async {
        Logger().d('RESPONSE_CODE: ${response.statusCode}');
        Logger().d('RESPONSE_BODY: ${response.bodyString}');
        if (response.statusCode == 401 || response.statusCode == 403) {
          Get.offAllNamed(Routes.HOME);
          SnackbarUtil.showWarning(
            message: 'Session expired. Please log in again.',
          );
        }
        return response;
      },
    );

    Logger().i('Logged in: $url');
    Get.put(connect);
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // TODO: Set colors of system bottom navigation bar as per app theme -- not useful here
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   systemNavigationBarColor: MaterialTheme.lightScheme().surfaceVariant,
    //   systemNavigationBarDividerColor:
    //       MaterialTheme.lightScheme().surfaceVariant,
    // ));
  }
}