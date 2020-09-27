import 'package:Apps/components/route_list.dart';
import 'package:Apps/router/route_type.dart';
import 'package:flutter/material.dart';

class WidgetScreen extends StatelessWidget {
  final Routes routes = Routes(
    routes: {
      'Container': '/container',
      'Cupertino': '/cupertino',
    },
    prefix: "/demo_app/widgets",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Widgets')),
      body: RouteList(routes),
    );
  }
}
