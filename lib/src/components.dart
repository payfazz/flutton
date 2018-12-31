import 'package:flutton/src/config.dart';
import 'package:flutton/src/service/stories/api/api.dart';
import 'package:flutton/src/service/stories/stories.dart';
import 'package:kiwi/kiwi.dart';
import 'package:dio/dio.dart';

class Components {
  Components(Config config) {
    _container.registerInstance(Dio(Options(baseUrl: config.baseUrl)));
    _container.registerSingleton((c) => StoriesAPI(dio: c.resolve<Dio>()));
    _container
        .registerSingleton((c) => StoriesService(api: c.resolve<StoriesAPI>()));
  }
  final Container _container = Container();
  T getComponent<T>([String name]) => _container.resolve<T>(name);
}
