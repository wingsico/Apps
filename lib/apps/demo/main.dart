import 'package:Apps/components/route_list.dart';
import 'package:Apps/router/route_type.dart';
import 'package:flutter/material.dart';

class DemoApp extends StatelessWidget {
  final routes = Routes(
    routes: {
      'Widgets': '/widgets',
      'Pratices': '/practices',
    },
    prefix: '/demo_app',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DemoApp')),
      body: RouteList(routes),
    );
  }
}
