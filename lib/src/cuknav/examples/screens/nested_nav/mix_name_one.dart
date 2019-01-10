import 'package:flutter/material.dart';
import 'package:flutton/src/cuknav/examples/blocs/mix_name.dart';
import 'package:flutton/src/cuknav/store/connector.dart';

class FluttonCukNavExampleMixNameOneScreen extends StatelessWidget {
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
                      child: Text('Screen Mix Name One ${snapshot.data}.'),
                    );
                  },
                ),
                Center(
                  child: RaisedButton(
                    child: Text('Mix Name'),
                    onPressed: () {
                      bloc.mixName();
                    },
                  ),
                ),
                Center(
                  child: RaisedButton(
                    child: Text('Move to screen mix screen two'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('mix_name_two');
                    },
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
