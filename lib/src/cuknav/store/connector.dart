import 'package:flutter/material.dart';
import 'package:flutton/src/cuknav/store/provider.dart';

///
/// FluttonStoreConnector
/// is a connector to get the data from provider
/// , so when you already create the provider then you want
/// to access the data inside of it. You just using the
/// connector below inside your ui
///
class FluttonStoreConnector<T> extends StatelessWidget {
  FluttonStoreConnector({
    @required this.builder,
  });

  final Function(BuildContext, T) builder;

  @override
  Widget build(BuildContext ctx) {
    T store = FluttonStoreProvider.of<T>(ctx).store;
    return Builder(
      builder: (BuildContext ctx) => builder(
            ctx,
            store,
          ),
    );
  }
}
