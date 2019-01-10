import 'package:flutter/material.dart';

///
/// FluttonStoreProvider
/// Is the class when you want to store the data
/// inside the nested navigation and you can used
/// at some screen inside navigation
///
class FluttonStoreProvider<T> extends InheritedWidget {
  ///
  /// FluttonStoreProvider
  /// @param store (optional) => the data what you want to store
  /// @param child => the ui want to show the user
  ///
  FluttonStoreProvider({
    Key key,
    this.store,
    @required this.child,
  }) : super(key: key, child: child);

  T store;
  final Widget child;

  @override
  bool updateShouldNotify(FluttonStoreProvider oldWidget) {
    return oldWidget.store != store || oldWidget.child != child;
  }

  static FluttonStoreProvider<T> of<T>(BuildContext context) {
    final type = _typeOf<FluttonStoreProvider<T>>();
    final FluttonStoreProvider<T> container =
        context.inheritFromWidgetOfExactType(type);

    return container;
  }

  static Type _typeOf<T>() => T;
}
