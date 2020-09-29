import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments;
    final String text = args['text'];

    return Scaffold(
      appBar: AppBar(title: Text('Container Demo'), centerTitle: true),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(color: Colors.black12),
          child: Text('$text', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
