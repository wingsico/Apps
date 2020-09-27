import 'package:Apps/apps/demo/main.dart';
import 'package:Apps/apps/demo/screens/widgets.dart';
import 'package:Apps/apps/demo/screens/widgets/container.dart';
import 'package:Apps/apps/demo/screens/widgets/curpertinao.dart';
import 'package:Apps/apps/quiz/main.dart';
import 'package:Apps/common/auth.dart';
import 'package:Apps/router/route_type.dart';

import '../main.dart';

String mainInitialRoute = '/';

Map<String, RouteMeta> mainRoutes = {
  '/': RouteMeta((arg) => MainPage()),
  '/demo_app': RouteMeta((arg) => DemoApp()),
  '/demo_app/widgets': RouteMeta((arg) => WidgetScreen()),
  '/demo_app/widgets/container': RouteMeta((arg) => ContainerScreen()),
  '/demo_app/widgets/cupertino': RouteMeta((arg) => CupertinoScreen()),
  '/quiz_app': RouteMeta((arg) => QuizApp(), [AuthType.Admin])
};
