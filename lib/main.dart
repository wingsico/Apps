import 'package:flutter/material.dart';
import 'package:Apps/apps/demo/main.dart';

import 'apps/demo/screens/container.dart';
import 'apps/demo/screens/widgets.dart';
import 'apps/quiz/main.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      routes: {
        '/': (context) => MainPage(),
        '/demo_app': (BuildContext context) => DemoScreen(),
        '/demo_app/widgets': (BuildContext context) => Widgets(),
        '/demo_app/widgets/container': (BuildContext context) =>
            ContainerDemo(text: ModalRoute.of(context).settings.arguments),
        '/quiz_app': (BuildContext context) => QuizApp(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(title: Text('Apps')),
      body: AppList(onTap: () {
        _scaffoldState.currentState.showSnackBar(
          SnackBar(
            content: Text('This is the SnackBar'),
          ),
        );
      }),
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
  final Map<String, String> apps = {
    "DemoApp": '/demo_app',
    "QuizApp": '/quiz_app',
  };

  final Function onTap;

  AppList({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appNames = apps.keys.toList();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[400],
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Container(height: 1, color: Colors.grey[300]),
                ),
                itemCount: appNames.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    appNames[index],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white),
                  ),
                  trailing: Icon(Icons.chevron_right,
                      size: 32.0, color: Colors.white),
                  onTap: () {
                    Navigator.of(context).pushNamed(apps[appNames[index]]);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: RaisedButton(
                child: Text('Show SnackBar'),
                onPressed: () {
                  onTap();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
