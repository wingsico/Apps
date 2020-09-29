import 'package:Apps/common/responsive.dart';
import 'package:Apps/components/tabbar.dart';
import 'package:flutter/material.dart';

class CustomTabbarScreen extends StatelessWidget {
  @override
  build(BuildContext ctx) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: DefaultTextStyle(
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Tabbar(
                    title: Text('Tabbar: ${Responsive.bottomHeight}'),
                    actions: [Icon(Icons.ac_unit)],
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text('body'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
