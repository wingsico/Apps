import 'package:Apps/common/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import 'icon_card.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: Responsive.screenHeight * 0.8,
        child: Row(children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Spacer(),
                  IconCard(icon: "assets/icons/sun.svg"),
                  IconCard(icon: "assets/icons/icon_2.svg"),
                  IconCard(icon: "assets/icons/icon_3.svg"),
                  IconCard(icon: "assets/icons/icon_4.svg"),
                ],
              ),
            ),
          ),
          Container(
            height: Responsive.screenHeight * 0.8,
            width: Responsive.screenWidth * 0.75,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/img.png"),
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(63),
                bottomLeft: Radius.circular(63),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 60,
                  color: kPrimaryColor.withOpacity(0.29),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
