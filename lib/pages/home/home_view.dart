import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:people_tmdb/tools/constants.dart';
import 'package:people_tmdb/utils/screens.dart';
import 'package:people_tmdb/widgets/web_bar_widget.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  static const String id = "/home_page";

  final homeLogic = Get.put(HomeLogic());

  @override
  build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // // Initialize Firebase.
    // await Firebase.initializeApp();
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              WebBarWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Text(
                        kPeopleTxt,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Obx(() {
                if (homeLogic.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenWeb.width(context) * 0.1),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: homeLogic.mainItemList.length,
                      itemBuilder: (context, index) {
                        return homeLogic.mainItemList[index];
                      },
                    ),
                  );
                }
              })),
            ],
          ),
        ),
      ),
    );
  }
}
