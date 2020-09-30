import 'package:Apps/apps/plant/screens/details/components/title_and_price.dart';
import 'package:Apps/apps/plant/screens/home/components/recommend_plant_card.dart';
import 'package:Apps/common/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'image_and_icons.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecommendPlantData data = ModalRoute.of(context).settings.arguments;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        children: [
          Column(
            children: [
              ImageAndIcons(),
              TitleAndPrice(data: data),
              SizedBox(height: kDefaultPadding),
              Row(
                children: [
                  SizedBox(
                    width: Responsive.screenWidth / 2,
                    height: 84,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                      ),
                      color: kPrimaryColor,
                      onPressed: () {},
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 84,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
