import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'feature_plant_card.dart';

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: kDefaultPadding),
        child: Row(
          children: [
            FeaturePlantCard(
              image: "assets/images/bottom_img_1.png",
              onPressed: () {},
            ),
            FeaturePlantCard(
              image: "assets/images/bottom_img_2.png",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
