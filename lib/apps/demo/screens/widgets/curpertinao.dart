import 'package:flutter/cupertino.dart';

class CupertinoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Cupertino Bar")),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text("Press"),
          onPressed: () {},
        ),
      ),
    );
  }
}
