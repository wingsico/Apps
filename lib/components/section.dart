import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget child;
  Section({this.child});

  @override
  build(BuildContext ctx) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Card(
        elevation: 4,
        child: child,
      ),
    );
  }
}
