import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../common/auth.dart';

class Routes {
  Map<String, RoutePayload> routes;
  String prefix;

  Routes(this.routes, {this.prefix = ""}) {
    routes.forEach((key, value) {
      routes[key] =
          RoutePayload("$prefix${value.path}", arguments: value.arguments);
    });
  }

  List<RouteItem> get list {
    return routes.keys
        .map<RouteItem>((key) => RouteItem(key, payload: routes[key]))
        .toList();
  }
}

class RoutePayload {
  final Object arguments;
  final String path;

  RoutePayload(this.path, {this.arguments});
}

class RouteItem {
  final String name;
  final RoutePayload payload;

  RouteItem(this.name, {this.payload});
}

typedef Widget RouteWidget(BuildContext ctx);

/// RouteMeta 创建全局路由时使用 RouteMeta 定义路由参数
class RouteMeta {
  final RouteWidget widget;
  final List<AuthType> auths;

  const RouteMeta(this.widget, {this.auths});
}
