import 'package:flutter/material.dart';

import '../../model/location.dart';
import '../../style.dart';

const itemHeight = 100.0;

class ItemLocationList extends StatelessWidget {
  final Location location;
  final bool darkTheme;

  const ItemLocationList(
      {super.key, required this.location, this.darkTheme = false});

  @override
  Widget build(BuildContext context) {
    final title = location.name;
    final subTitle = location.userItinerarySummary;
    final caption = location.tourPackageName.toUpperCase();

    return Container(
      padding: const EdgeInsets.all(0.0),
      height: itemHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: darkTheme ? Styles.titleDark : Styles.titleLight,
          ),
          Text(
            subTitle,
            style: Styles.subTitleStyle,
          ),
          Text(
            caption,
            style: Styles.captionStyle,
          ),
        ],
      ),
    );
  }
}
