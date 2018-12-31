import 'package:flutter/material.dart';

class StreamInitializer extends StatefulWidget {
  StreamInitializer({@required this.builder, @required this.onInitState});
  final StreamBuilder builder;
  final Function() onInitState;

  @override
  State<StatefulWidget> createState() {
    return _StreamInitializerState();
  }
}

class _StreamInitializerState extends State<StreamInitializer> {
  @override
  void initState() {
    super.initState();
    widget.onInitState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder;
  }
}
