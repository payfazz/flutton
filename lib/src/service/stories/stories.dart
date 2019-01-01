import 'package:flutton/src/service/stories/api/api.dart';
import 'package:meta/meta.dart';

class StoriesService {
  StoriesService({@required this.api});
  final StoriesAPI api;
  Future<List<int>> getBestStories() async {
    return api.getBestStories();
  }
}
