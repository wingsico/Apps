import 'package:Apps/apps/plant/screens/home/components/recommend_plant_card.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key key,
    @required this.data,
  }) : super(key: key);

  final RecommendPlantData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: data.title + "\n",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: kTextColor, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: data.country,
                  style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "\$${data.price}",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
