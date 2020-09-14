import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DemoApp')),
      body: DemoList(),
    );
  }
}

class DemoList extends StatelessWidget {
  final demoList = {'Route': '', 'Redux': '', 'Widgets': '/demo_app/widgets'};

  @override
  Widget build(BuildContext context) {
    final demoNames = demoList.keys.toList();
    final demoRoutePaths = demoList.values.toList();
    final separator = List.filled(10, Icon(Icons.stars, color: Colors.blue));
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(demoNames[index]),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.of(context).pushNamed(demoRoutePaths[index]);
          },
        );
      },
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
        child: Row(
          children: separator,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
      itemCount: demoNames.length,
    );
  }
}
