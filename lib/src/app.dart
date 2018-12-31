import 'package:flutter/material.dart';
import 'package:flutton/flutton/provider.dart';
import 'package:flutton/src/components.dart';
import 'package:flutton/src/config.dart';
import 'package:flutton/src/router.dart';

class Application extends StatelessWidget {
  Application({@required this.config});
  final Config config;
  @override
  Widget build(BuildContext context) {
    return Provider<Components>(
      components: Components(config),
      child: Router(),
    );
  }
}
