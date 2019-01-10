import 'package:flutter/material.dart';
import 'package:flutton/src/cuknav/examples/blocs/mix_name.dart';
import 'package:flutton/src/cuknav/store/connector.dart';

class FluttonCukNavExampleMixNameTwoScreen extends StatelessWidget {
  FluttonCukNavExampleMixNameTwoScreen({
    this.goToRootScreen,
  });

  final Function goToRootScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FluttonStoreConnector<MixNameBloc>(
        builder: (BuildContext ctx, MixNameBloc bloc) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<String>(
                  stream: bloc.name,
                  builder: (BuildContext ctx, AsyncSnapshot<String> snapshot) {
                    return Center(
                      child: Text('Screen Mix Name Two ${snapshot.data}.'),
                    );
                  },
                ),
                Center(
                  child: RaisedButton(
                    child: Text('mix'),
                    onPressed: () {
                      bloc.mixName();
                    },
                  ),
                ),
                Center(
                  child: RaisedButton(
                      child: Text('Move to screen root'),
                      onPressed: goToRootScreen),
                ),
              ],
            ),
      ),
    );
  }
}
