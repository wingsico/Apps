import 'package:flutter/material.dart';
import 'common/auth.dart';
import 'common/global.dart';
import 'common/size_fit.dart';
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

class ErrorAuthPage extends StatelessWidget {
  final List<AuthType> needAuths;

  ErrorAuthPage(this.needAuths);

  String get needAuthsString {
    return this.needAuths.map<String>((auth) => auth.name).join(',');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('路由权限不足'), centerTitle: true),
      body: Stack(
        children: [
          Positioned.fill(
            top: 30,
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    text: '当前权限: ',
                    children: [
                      TextSpan(
                        text: Global.currentAuth.name,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text.rich(
                    TextSpan(
                      text: '所需权限: ',
                      children: [
                        TextSpan(
                          text: needAuthsString,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: SizeFit.physicalWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: RaisedButton(
                    child: Text('Login As Admin'),
                    onPressed: () {
                      Global.updateAuthType(AuthType.Admin);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: RaisedButton(
                      child: Text('Login As Annoymous'),
                      onPressed: () {
                        Global.updateAuthType(AuthType.Anonymous);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                LayoutBuilder(
                  builder: (ctx, constraint) {
                    return Container(
                      width: constraint.maxWidth * 0.5,
                      child: RaisedButton(
                        child: Text('Login As Normal'),
                        onPressed: () {
                          Global.updateAuthType(AuthType.Normal);
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
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
