import 'dart:async';

import 'package:flutton/flutton/bloc_provider.dart';
import 'package:flutton/src/service/stories/stories.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  HomeBloc(this._service);
  final StoriesService _service;

  final BehaviorSubject<void> _controller = BehaviorSubject<void>();
  StreamSink<void> get fetchFavoriteStories => _controller.sink;
  Observable<List<int>> get favoriteStories => _controller.stream
      .flatMap((_) => Observable.fromFuture(this._service.getBestStories()));

  @override
  void dispose() {
    _controller.close();
  }
}
