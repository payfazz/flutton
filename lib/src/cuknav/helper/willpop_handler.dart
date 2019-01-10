import 'package:flutter/material.dart';

///
/// WillPopHandler
/// Mixin who handle the pop navigation from the nested navigation
///
mixin WillPopHandler {
  Future<bool> handle(Route<dynamic> route) async {
    if (route?.navigator?.canPop() ?? false) {
      route.navigator.pop();
      return false;
    }

    return true;
  }
}
