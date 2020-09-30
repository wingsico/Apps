import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'feature_plants.dart';
import 'header_with_searchbox.dart';
import 'recommend_plants.dart';
import 'title_with_more_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchbox(size: size),
          TitleWithMoreButton(title: 'Recommended', onPressed: () {}),
          RecommendPlants(),
          TitleWithMoreButton(title: 'Featured Plants', onPressed: () {}),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
