import 'package:Apps/components/route_list.dart';
import 'package:Apps/router/route_type.dart';
import 'package:flutter/material.dart';

class PracticeScreen extends StatelessWidget {
  final Routes routes = Routes(
    {
      'CustomTabbar': RoutePayload('/tabbar'),
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
