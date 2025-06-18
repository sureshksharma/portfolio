import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'initializer.dart';
import 'theme/theme.dart';

Future<void> main() async {
  usePathUrlStrategy();
  await Initializer.init();
  runApp(
    GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Tvarit Cabs - Your Trusted Travel Partner",
      theme: MaterialTheme.lightThemeData(),
      darkTheme: MaterialTheme.darkThemeData(),
      themeMode: ThemeMode.system,
      routeInformationParser: GetInformationParser(
        initialRoute: AppPages.INITIAL,
      ),
      routerDelegate: GetDelegate(
        backButtonPopMode: PopMode.Page,
        notFoundRoute: AppPages.UNKNOWN,
      ),
      getPages: AppPages.routes,
      scrollBehavior: MyCustomScrollBehavior(),
    ),
  );
}

// Enable scrolling with mouse dragging
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
