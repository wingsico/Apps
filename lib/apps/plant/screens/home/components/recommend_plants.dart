import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'recommend_plant_card.dart';

List<RecommendPlantData> recommendedPlants = [
  RecommendPlantData(
    title: 'Samantha',
    country: 'Russian',
    price: 400,
    image: 'assets/images/image_1.png',
  ),
  RecommendPlantData(
    title: 'Angelica',
    country: 'Russian',
    price: 540,
    image: 'assets/images/image_2.png',
  ),
  RecommendPlantData(
    title: 'Samantha',
    country: 'China',
    price: 360,
    image: 'assets/images/image_3.png',
  ),
];

class RecommendPlants extends StatelessWidget {
  const RecommendPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(
          right: kDefaultPadding,
        ),
        child: Row(
          children: recommendedPlants
              .map<RecommendPlantCard>((data) => RecommendPlantCard(
                    data: data,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/plant_app/details', arguments: data);
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
