import 'package:flutter/material.dart';

import '../../../constants.dart';

class RecommendPlantData {
  RecommendPlantData({this.title, this.country, this.image, this.price});
  final String title, country, image;
  final int price;
}

class RecommendPlantCard extends StatelessWidget {
  const RecommendPlantCard({
    Key key,
    this.data,
    this.onPressed,
  }) : super(key: key);

  final RecommendPlantData data;

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(children: [
        Image.asset(data.image),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
            ),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${data.title}\n'.toUpperCase(),
                        style: Theme.of(context).textTheme.button,
                      ),
                      TextSpan(
                        text: '${data.country}'.toUpperCase(),
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  '\$${data.price}',
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: kPrimaryColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
