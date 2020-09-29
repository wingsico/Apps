import 'package:Apps/components/scaffold.dart';
import 'package:Apps/components/section.dart';
import 'package:Apps/components/tabbar.dart';
import 'package:flutter/material.dart';
import 'components/switch_and_checkbox.dart';

class CustomTabbarScreen extends StatelessWidget {
  @override
  build(BuildContext ctx) {
    return MyScaffold(
      tabbar: Tabbar(title: Text('MyTabbar')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Section(child: SwitchAndCheckbox()),
        ]),
      ),
    );
  }
}
