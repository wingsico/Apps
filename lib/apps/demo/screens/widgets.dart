import 'package:Apps/components/route_list.dart';
import 'package:Apps/router/route_type.dart';
import 'package:flutter/material.dart';

class WidgetScreen extends StatelessWidget {
  final Routes routes = Routes(
    {
      'Container': RoutePayload('/container', arguments: {"text": "123"}),
      'Cupertino': RoutePayload('/cupertino'),
    },
    prefix: "/demo_app/widgets",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: Text('Widgets')),
      body: RouteList(routes),
    );
  }
}
