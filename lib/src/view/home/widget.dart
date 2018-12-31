import 'package:flutter/material.dart';
import 'package:flutton/flutton/bloc_provider.dart';
import 'package:flutton/flutton/provider.dart';
import 'package:flutton/src/components.dart';
import 'package:flutton/src/service/stories/stories.dart';
import 'package:flutton/src/view/home/bloc.dart';
import 'package:flutton/src/view/home/screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      bloc: HomeBloc(
        Provider.of<Components>(context).getComponent<StoriesService>(),
      ),
      child: HomeScreen(),
    );
  }
}
