import 'package:Apps/components/tabbar.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final Tabbar tabbar;
  final Widget body;

  MyScaffold({this.tabbar, this.body});

  @override
  build(BuildContext ctx) {
    return Material(
      child: Container(
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
              child: Column(
                children: [
                  if (tabbar != null) tabbar,
                  if (body != null)
                    Expanded(
                      flex: 1,
                      child: body,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
