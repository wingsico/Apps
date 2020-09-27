import 'package:Apps/common/auth.dart';
import 'package:Apps/common/global.dart';
import 'package:Apps/common/size_fit.dart';
import 'package:flutter/material.dart';

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
