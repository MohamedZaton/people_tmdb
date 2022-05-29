import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';

import '../../models/PeopleModel.dart';
import '../../tools/colors.dart';
import '../../tools/constants.dart';
import '../../widgets/flux_image.dart';
import '../home/home_logic.dart';

class PosterPage extends StatelessWidget {
  static const String id = "/poster_page";
  String? moviePosterPath;

  final homeLogic = Get.put(HomeLogic());

  PosterPage({Key? key, this.moviePosterPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgdDarkColor,
      appBar: AppBar(
        backgroundColor: kbkgdDark,
        title: Text(kPosterTxt),
        actions: [
          IconButton(
              onPressed: () {
                downloadPoster(moviePosterPath);
              },
              icon: Icon(
                Icons.cloud_download,
                color: Colors.white,
              )),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          PeopleModel actor = homeLogic.selectedPerson.value;
          String profileImage = "";

          if (actor.profilePath != null) {
            profileImage = kImageUrlSmall + actor.profilePath!;
          } else {
            profileImage = kAvatarImage;
          }

          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacing_middle)),
                        child: moviePosterPath != null
                            ? FluxImage(
                                imageUrl: moviePosterPath!
                                    .replaceAll("w200", "original"),
                                fit: BoxFit.fill,
                              )
                            : Text("Not Found this Poster: $moviePosterPath"),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Future<dynamic> downloadPoster(String? moviePosterPath) async {
    await GallerySaver.saveImage(moviePosterPath!, albumName: 'tmdb')
        .then((value) {
      return Get.snackbar(
        "Poster",
        "it is downloaded successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }
}
