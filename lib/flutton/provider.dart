import 'package:flutter/material.dart';

class Provider<T> extends InheritedWidget {
  Provider({
    this.components,
    @required child,
  }) : super(child: child);

  final T components;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static T of<T>(BuildContext context) {
    final type = _typeOf<Provider<T>>();
    Provider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.components;
  }

  static Type _typeOf<T>() => T;
}
