import 'package:flutter/material.dart';
import 'package:flutton/src/cuknav/examples/screens/next.dart';

class FluttonCukNavExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text('Main Screen')),
          Center(
            child: RaisedButton(
              child: Text('Move To Another Screen'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => FluttonCukNavExampleNextScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
