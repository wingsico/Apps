import 'package:flutter/material.dart';
import 'package:Apps/apps/demo/main.dart';

import 'apps/quiz/main.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apps')),
      body: AppList(),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Powered by wingsico')],
        ),
      ),
    );
  }
}

class AppList extends StatelessWidget {
  final Map<String, Widget> apps = {
    "DemoApp": DemoScreen(),
    "QuizApp": QuizApp(),
  };

  @override
  Widget build(BuildContext context) {
    var appNames = apps.keys.toList();
    return ListView.separated(
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Container(height: 1, color: Colors.grey[300]),
      ),
      itemCount: appNames.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(appNames[index],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        trailing: Icon(Icons.chevron_right, size: 32.0, color: Colors.blue),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => apps[appNames[index]]));
        },
      ),
    );
  }
}
