import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:people_tmdb/models/PeopleModel.dart';
import 'package:people_tmdb/utils/screens.dart';
import 'package:people_tmdb/widgets/flux_image.dart';

import '../../tools/colors.dart';
import '../../tools/constants.dart';
import '../home/home_logic.dart';

class DetailsPage extends StatelessWidget {
  static const String id = "/details_page";

  // final detailsLogic = Get.put(DetailsLogic());
  final homeLogic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgdDarkColor,
      appBar: AppBar(
        backgroundColor: kbkgdDark,
        title: Text(kDetailsTxt),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: spacing_large),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(spacing_middle),
                                  bottomRight:
                                      Radius.circular(spacing_standard_new)),
                              child: FluxImage(
                                imageUrl: profileImage,
                                fit: BoxFit.fill,
                                height: ScreenWeb.width(context) * 0.35,
                              ),
                            ),
                          ),
                          SizedBox(width: spacing_standard_new),
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  actor.name!,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text(
                                  actor.knownForDepartment!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: Colors.grey),
                                ),
                                SizedBox(height: spacing_control),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          actor.gender == 1
                                              ? Icons.female_outlined
                                              : Icons.male_outlined,
                                          color: Colors.white,
                                          size: spacing_large,
                                        ),
                                        Text(
                                          kGenderTxt,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: ScreenWeb.width(context) * 0.1,
                                      width: 0.5,
                                      color: klineVcColor,
                                      margin: EdgeInsets.only(
                                          left: spacing_standard_new,
                                          right: spacing_standard_new),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${actor.popularity}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          kPopularityTxt,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ],
                                ),

                                /// about p
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Container(
                          margin: EdgeInsets.all(spacing_standard_new),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                kAboutTxt,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    aboutDetails(
                                        actor.name, actor.knownForDepartment),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(height: spacing_standard_new),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "$kMovies  ",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ],
                              ),
                              SizedBox(height: spacing_standard_new),
                              GridView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: actor.knownFor!.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  String moviePosterPath = kImageUrlSmall +
                                      actor.knownFor![index].posterPath!;
                                  return ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(spacing_middle)),
                                    child: FluxImage(
                                      imageUrl: moviePosterPath,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  String aboutDetails(String? name, String? knownForDepartment) {
    return "One of the greatest $knownForDepartment of all time, $name was born  in Manhattan, New York City .";
  }
}
