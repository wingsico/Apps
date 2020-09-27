import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/auth.dart';

class RouteItem {
  final String name;
  final String path;
  RouteItem({@required this.name, @required this.path});
}

typedef Widget RouteWidget(Object arguments);

class RouteMeta {
  final RouteWidget widget;
  final List<AuthType> auths;

  const RouteMeta(this.widget, [this.auths]);
}

class Routes {
  final Map<String, String> routes;
  String prefix;

  Routes({@required this.routes, this.prefix = ""});

  List<RouteItem> get list {
    return this
        .routes
        .keys
        .map<RouteItem>(
            (key) => RouteItem(name: key, path: "$prefix${routes[key]}"))
        .toList();
  }
}
