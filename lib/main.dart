import 'package:flutter/material.dart';
import 'common/auth.dart';
import 'common/global.dart';
import 'common/size_fit.dart';
import 'components/error_auth_page.dart';
import 'components/not_found_page.dart';
import 'components/route_list.dart';
import 'router/route_type.dart';
import 'router/routes.dart';

void main() {
  Global.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeFit.init(); // 只能在 build 中初始化
    return MaterialApp(
      initialRoute: mainInitialRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          RouteMeta currentRouteMeta = mainRoutes[routeName];
          if (currentRouteMeta == null) {
            return NotFoundPage(routeName);
          }
          AuthType currentAuth = Global.currentAuth;
          if (currentAuth.checkAuth(currentRouteMeta.auths)) {
            return currentRouteMeta.widget(settings.arguments);
          }
          return ErrorAuthPage(currentRouteMeta.auths);
        });
      },
      // routes: {
      //   '/': (context) => MainPage(),
      //   '/demo_app': (BuildContext context) => DemoScreen(),
      //   '/demo_app/widgets': (BuildContext context) => Widgets(),
      //   '/demo_app/widgets/container': (BuildContext context) =>
      //       ContainerDemo(text: ModalRoute.of(context).settings.arguments),
      //   '/quiz_app': (BuildContext context) => QuizApp(),
      // },
    );
  }
}

class MainPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldState = Global.key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(title: Text('Apps')),
      body: AppList(),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Powered by wingsico'),
            ),
          ],
        ),
      ),
    );
  }
}

class AppList extends StatelessWidget {
  final Routes appRoutes = Routes(routes: {
    "DemoApp": '/demo_app',
    "QuizApp": '/quiz_app',
  });

  AppList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RouteList(appRoutes);
    // var appNames = apps.keys.toList();
    // return Container(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Expanded(
    //         child: Container(
    //           // decoration: BoxDecoration(
    //           //   color: Colors.blue[400],
    //           // ),
    //           child: ListView.separated(
    //             separatorBuilder: (context, index) => Padding(
    //               padding: const EdgeInsets.only(left: 12.0, right: 12.0),
    //               child: Container(height: 1, color: Colors.grey[300]),
    //             ),
    //             itemCount: appNames.length,
    //             itemBuilder: (context, index) => ListTile(
    //               title: Text(
    //                 appNames[index],
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.normal,
    //                   fontSize: 18.0,
    //                   color: Colors.black,
    //                 ),
    //               ),
    //               trailing: Icon(Icons.chevron_right,
    //                   size: 32.0, color: Colors.white),
    //               onTap: () {
    //                 Navigator.of(context).pushNamed(apps[appNames[index]]);
    //               },
    //             ),
    //           ),
    //         ),
    //       ),
    // Expanded(
    //   child: Center(
    //     child: RaisedButton(
    //       child: Text('Show SnackBar'),
    //       onPressed: () {
    //         Global.key.currentState
    //             .showSnackBar(SnackBar(content: Text('hello')));
    //         // Scaffold scaffold =
    //         //     context.findAncestorWidgetOfExactType<Scaffold>();
    //         // print(scaffold);
    //         // (scaffold.key as GlobalKey<ScaffoldState>)
    //         //     .currentState
    //         //     .showSnackBar(SnackBar(content: Text('hello')));

    //         // ScaffoldState _state =
    //         //     context.findAncestorStateOfType<ScaffoldState>();
    //         // _state.showSnackBar(SnackBar(content: Text('hello')));

    //         ScaffoldState _state = Scaffold.of(context);
    //         _state.showSnackBar(SnackBar(content: Text('hello')));
    //         // scaffold
    //         //     .createState()
    //         //     .showSnackBar(SnackBar(content: Text('hello')));
    //       },
    //     ),
    //   ),
    // )
    //     ],
    //   ),
    // );
  }
}
