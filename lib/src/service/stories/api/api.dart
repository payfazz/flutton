import 'package:dio/dio.dart';
import 'package:flutton/flutton/errors/unauthorized.dart';
import 'package:meta/meta.dart';

class StoriesAPI {
  StoriesAPI({@required this.dio});
  final Dio dio;
  Future<List<int>> getBestStories() async {
    final result =
        await dio.get('v0/beststories.json', data: {'print': 'pretty'});
    throw UnauthorizedError();
    return List<int>.from(result.data);
  }
}
