import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutton/src/cuknav/helper/generate_route.dart';
import 'package:flutton/src/cuknav/helper/willpop_handler.dart';
import 'package:flutton/src/cuknav/model/screen.dart';
import 'package:flutton/src/cuknav/store/provider.dart';

///
/// FluttonCukNav (Cukup Navigasi)
/// is a helper to store information inside the route and
/// make a new route for that. For example, you have a sharing
/// state between two screen. That is screen A & B, and you dont
/// want to use global state like redux because is so painfull,
/// and you dont want to passing a state callback, to change it.
/// How we can solve it ? you can save your state inside
/// FluttonCukNav and create a new route, inside it. Then
/// you can consume the store you provide at flutton cuk nav
/// to sharing inside the route you been created.
///
/// * see the example at folder examples
///
class FluttonCukNav<T> extends StatelessWidget
    with GenerateRoute, WillPopHandler {
  ///
  /// @param initialRouteName => is the screen will be rendered at the first nested route
  /// @param context => we expect you give to us parent context, so you can use it to navigate
  /// outside from the nested navigation. I think, when you created a new navigation inside there
  /// you can go to outside with the current context, when you want to navigate to outside you have
  /// to using the context from the outside nested navigation (fluttoncuknav)
  /// @param routes => that's list of screen you want to fill inside the nested navigation
  /// @param store (optional) => if you want to save the state inside nested route, and you want to use
  /// at some screen inside nested route. You have create your own model, and apply it
  ///
  FluttonCukNav({
    Key key,
    this.store,
    @required this.initialRouteName,
    @required this.context,
    @required this.routes,
  })  : _router = Router(),
        super(key: key);

  final T store;
  final Router _router;
  final BuildContext context;
  final String initialRouteName;
  final List<FluttonCukNavModel> routes;

  // inner property
  Route<dynamic> _route;

  @override
  Widget build(BuildContext ctx) {
    generate(context, _router, routes);
    return FluttonStoreProvider<T>(
      store: store,
      child: WillPopScope(
        onWillPop: () {
          handle(_route);
        },
        child: Navigator(
          initialRoute: initialRouteName,
          onGenerateRoute: (RouteSettings setting) {
            _route = _router.generator(setting);
            return _route;
          },
        ),
      ),
    );
  }
}
