import 'dart:async';

import 'package:flutton/flutton/bloc_provider.dart';
import 'package:flutton/src/service/stories/stories.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  HomeBloc(this._service);
  final StoriesService _service;

  final BehaviorSubject<void> _controller = BehaviorSubject<void>();
  StreamSink<void> get fetchFavoriteStories => _controller.sink;
  Observable<List<int>> get favoriteStories => _controller.stream.flatMap((_) {
        _service
            .getBestStories()
            .then(print, onError: (err, stack) => print(err));

        return Observable.just([1, 2, 3]);
      }).doOnError((err) => print(err));

  @override
  void dispose() {
    _controller.close();
  }
}
