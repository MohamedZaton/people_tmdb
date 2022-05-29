import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:people_tmdb/pages/details/details_view.dart';
import 'package:people_tmdb/pages/home/home_logic.dart';
import 'package:people_tmdb/pages/home/home_view.dart';
import 'package:people_tmdb/themes/get_theme.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();

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
          initialRoute: HomePage.id,
          getPages: [
            GetPage(
              name: HomePage.id,
              page: () => HomePage(),
              binding: BindingsBuilder(() {
                Get.lazyPut<HomeLogic>(() => HomeLogic());
              }),
            ),
            GetPage(
              name: DetailsPage.id,
              page: () => DetailsPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut<HomeLogic>(() => HomeLogic());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
