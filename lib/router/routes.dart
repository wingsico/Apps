import 'package:Apps/apps/demo/main.dart';
import 'package:Apps/apps/demo/screens/practices.dart';
import 'package:Apps/apps/demo/screens/practices/tabbar.dart';
import 'package:Apps/apps/demo/screens/widgets.dart';
import 'package:Apps/apps/demo/screens/widgets/container.dart';
import 'package:Apps/apps/demo/screens/widgets/curpertinao.dart';
import 'package:Apps/apps/plant/main.dart';
import 'package:Apps/apps/plant/screens/details/details_screen.dart';
import 'package:Apps/apps/quiz/main.dart';
import 'package:Apps/common/auth.dart';
import 'package:Apps/router/route_type.dart';

import '../main.dart';

String mainInitialRoute = '/';

Map<String, RouteMeta> mainRoutes = {
  '/': RouteMeta((ctx) => MainPage()),
  '/demo_app': RouteMeta((ctx) => DemoApp()),
  '/demo_app/widgets': RouteMeta((ctx) => WidgetScreen()),
  '/demo_app/widgets/container': RouteMeta((ctx) => ContainerScreen()),
  '/demo_app/widgets/cupertino': RouteMeta((ctx) => CupertinoScreen()),
  '/demo_app/practices': RouteMeta((ctx) => PracticeScreen()),
  '/demo_app/practices/tabbar': RouteMeta((ctx) => CustomTabbarScreen()),
  '/quiz_app': RouteMeta((ctx) => QuizApp(), auths: [AuthType.Admin]),
  '/plant_app': RouteMeta((ctx) => PlantApp()),
  '/plant_app/details': RouteMeta((ctx) => DetailsScreen()),
};
