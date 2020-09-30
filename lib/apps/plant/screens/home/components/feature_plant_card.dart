import 'package:flutter/material.dart';
import '../../../constants.dart';

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    Key key,
    this.image,
    this.onPressed,
  }) : super(key: key);

  final String image;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width * 0.8,
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
