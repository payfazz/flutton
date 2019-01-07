import 'package:flutter/material.dart';

///
/// ComposeWidget
/// is the mixin class will be determine what the widget will be shown
/// at the screen
///
mixin ComposeWidget {
  Function compose(bool status, bool error) =>
      (Widget onLoad, Widget onError, Widget onSuccess) {
        if (status && !error && onLoad != null) {
          return onLoad;
        } else if (!status && error && onError != null) {
          return onError;
        }

        return onSuccess;
      };
}
