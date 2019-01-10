import 'package:flutter/material.dart';

typedef Widget HandlerFunction(
  BuildContext context,
  BuildContext parentContext,
  Map<String, dynamic> params,
);

///
/// FluttonCukNavModel
/// base model for list of screen will be used
/// inside the nested navigation
///
class FluttonCukNavModel {
  FluttonCukNavModel({
    @required this.pathName,
    @required this.handler,
  });

  final String pathName;
  final HandlerFunction handler;
}
