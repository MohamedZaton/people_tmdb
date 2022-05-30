import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:people_tmdb/pages/details/details_view.dart';
import 'package:people_tmdb/pages/home/home_controller.dart';
import 'package:people_tmdb/pages/home/home_view.dart';
import 'package:people_tmdb/pages/poster/poster_view.dart';
import 'package:people_tmdb/pages/splash/splash_controller.dart';
import 'package:people_tmdb/pages/splash/splash_view.dart';
import 'package:people_tmdb/themes/get_theme.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'People',
          darkTheme: buildDarkTheme(),
          theme: buildLightTheme(),
          initialRoute: SplashPage.id,
          getPages: [
            GetPage(
              name: HomePage.id,
              page: () => HomePage(),
              binding: BindingsBuilder(() {
                Get.lazyPut<HomeController>(() => HomeController());
              }),
            ),
            GetPage(
              name: DetailsPage.id,
              page: () => DetailsPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut<HomeController>(() => HomeController());
              }),
            ),
            GetPage(
              name: PosterPage.id,
              page: () => PosterPage(),
            ),
            GetPage(
              name: SplashPage.id,
              page: () => SplashPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut<SplashController>(() => SplashController());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
