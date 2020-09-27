import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final String errorRoutePath;
  const NotFoundPage(this.errorRoutePath);

  @override
  build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Not Found'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/404.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text.rich(
                TextSpan(
                  text: 'Page of ',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  children: [
                    TextSpan(
                      text: errorRoutePath,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(text: ' Not Found.')
                  ],
                ),
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
