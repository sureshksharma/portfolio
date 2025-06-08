import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'initializer.dart';
import 'theme/theme.dart';

Future<void> main() async {
  await Initializer.init();
  runApp(
    GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "CabService",
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
    ),
  );
}