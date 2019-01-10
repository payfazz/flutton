import 'package:flutter/material.dart';
import 'package:flutton/src/cuknav/cuknav.dart';
import 'package:flutton/src/cuknav/examples/blocs/mix_name.dart';
import 'package:flutton/src/cuknav/examples/screens/nested_nav/mix_name_one.dart';
import 'package:flutton/src/cuknav/examples/screens/nested_nav/mix_name_two.dart';
import 'package:flutton/src/cuknav/model/screen.dart';

class FluttonCukNavExampleInitNestedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FluttonCukNav(
      store: MixNameBloc(),
      initialRouteName: 'mix_name_one',
      routes: <FluttonCukNavModel>[
        FluttonCukNavModel(
          pathName: 'mix_name_one',
          handler: (
            BuildContext ctx,
            BuildContext parentContext,
            Map<String, dynamic> params,
          ) =>
              FluttonCukNavExampleMixNameOneScreen(),
        ),
        FluttonCukNavModel(
          pathName: 'mix_name_two',
          handler: (
            BuildContext ctx,
            BuildContext parentContext,
            Map<String, dynamic> params,
          ) =>
              FluttonCukNavExampleMixNameTwoScreen(goToRootScreen: () {
                Navigator.of(parentContext).pop();
              }),
        ),
      ],
      context: context,
    );
  }
}
