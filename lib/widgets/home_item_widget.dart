import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:people_tmdb/tools/colors.dart';
import 'package:people_tmdb/utils/screens.dart';
import 'package:people_tmdb/widgets/flux_image.dart';

import '../models/PeopleModel.dart';
import '../tools/constants.dart';

class HomeItemWgt extends StatelessWidget {
  final PeopleModel personItemModel;
  final int index;
  final void Function()? onTapAction;
  const HomeItemWgt({
    Key? key,
    required this.personItemModel,
    required this.index,
    required this.onTapAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctx = context;
    String profileImage = "";
    if (personItemModel.profilePath != null) {
      profileImage = kImageUrlSmall + personItemModel.profilePath!;
    } else {
      profileImage = kAvatarImage;
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 1),
                  blurRadius: 2.0,
                ),
              ]),
          child: Material(
            borderRadius: BorderRadius.circular(12.0),
            color: kbkgdDark,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onTapAction,
              child: index.isOdd
                  ? Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// main pic 1
                        Expanded(flex: 2, child: Pic(profileImage, ctx)),

                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: ScreenWeb.width(ctx) * 0.1,
                          ),
                        ),

                        /// main info 1
                        Expanded(
                          flex: 2,
                          child: Info(
                            personModel: personItemModel,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// main info 2
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Info(
                            personModel: personItemModel,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: ScreenWeb.width(ctx) * 0.1,
                          ),
                        ),

                        /// main pic 2
                        Expanded(flex: 2, child: Pic(profileImage, ctx)),
                      ],
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget Pic(String imagePath, BuildContext ctx) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FluxImage(
          imageUrl: imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// info  App
class Info extends StatelessWidget {
  final PeopleModel personModel;

  Info({
    required this.personModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Wrap(
          children: [
            Text(
              personModel.name!,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ],
    );
  }
}

/// tech icons
