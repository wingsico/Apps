import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: kDefaultPadding * 2,
            right: kDefaultPadding * 2,
            bottom: kDefaultPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: SvgPicture.asset("assets/icons/flower.svg"),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/heart-icon.svg"),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/user-icon.svg"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
