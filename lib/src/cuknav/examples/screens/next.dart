import 'package:flutter/material.dart';
import 'package:flutton/src/cuknav/examples/screens/nested_nav/main.dart';

class FluttonCukNavExampleNextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text('This screen from main screen')),
          Center(
            child: RaisedButton(
              child: Text('Move to fluttoncuknav'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => FluttonCukNavExampleInitNestedScreen(),
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
