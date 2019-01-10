import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutton/src/cuknav/model/screen.dart';

///
/// GenerateRoute
/// Mixin who make the route inside the nested navigation
///
mixin GenerateRoute {
  void generate(
      BuildContext context, Router r, List<FluttonCukNavModel> models) {
    models.forEach(
      (model) {
        r.define(
          model.pathName,
          handler: Handler(
            handlerFunc: (BuildContext ctx, Map<String, dynamic> params) =>
                model.handler(ctx, context, params),
          ),
        );
      },
    );
  }
}
