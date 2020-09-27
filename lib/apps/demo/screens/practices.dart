import 'package:Apps/components/route_list.dart';
import 'package:Apps/router/route_type.dart';
import 'package:flutter/material.dart';

class PracticeScreen extends StatelessWidget {
  final Routes routes = Routes(
    routes: {
      '幸福里精选好房': '/xfl_demo',
    },
    prefix: "/demo_app/practices",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Practices')),
      body: RouteList(routes),
    );
  }
}
