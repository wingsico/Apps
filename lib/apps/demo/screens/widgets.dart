import 'package:flutter/material.dart';

class Widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Widgets')),
        body: WidgetsList(prefix: '/demo_app/widgets'));
  }
}

class WidgetsList extends StatelessWidget {
  final widgets = {
    'Container': '/container',
  };

  final String prefix;

  WidgetsList({this.prefix, Key key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    final widgetsEntity = widgets.entries.toList();
    return ListView.builder(
        itemCount: widgetsEntity.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widgetsEntity[index].key),
            onTap: () => {
              Navigator.of(context)
                  .pushNamed('$prefix${widgetsEntity[index].value}')
            },
          );
        });
  }
}
