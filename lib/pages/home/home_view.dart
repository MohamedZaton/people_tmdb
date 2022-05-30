import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:people_tmdb/tools/constants.dart';
import 'package:people_tmdb/utils/screens.dart';

import '../../tools/colors.dart';
import '../../widgets/flux_image.dart';
import '../../widgets/network_bar_widget.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  static const String id = "/home_page";

  final homeLogic = Get.put(HomeController());
  var subscription;
  bool isConnecting = true;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kbkgdDark,
        title: FluxImage(
          imageUrl: "assets/images/title_logo.png",
          width: 200,
          height: 100,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            //  WebBarWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    kPeopleTxt,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
            Expanded(child: Obx(() {
              print(
                  "[home_view]connect network :${homeLogic.isConnecting.value}");
              if (homeLogic.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    SizedBox(
                        width: ScreenWeb.width(context),
                        child: NetworkBarWidget(
                            isConnect: homeLogic.isConnecting.value)),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenWeb.width(context) * 0.1),
                        child: LazyLoadScrollView(
                          key: Key(kLazyScrollKey),
                          onEndOfPage: homeLogic.loadNextPage,
                          isLoading: homeLogic.lastPage,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: homeLogic.mainItemList.length,
                            itemBuilder: (context, index) {
                              return homeLogic.mainItemList[index];
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            })),
          ],
        ),
      ),
    );
  }
}
