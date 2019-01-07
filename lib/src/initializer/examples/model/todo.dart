import 'package:meta/meta.dart';

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.completed,
  });

  Todo.fromJSON(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        completed = json['completed'];

  static List<Todo> fromListJSON(List<dynamic> jsons) {
    return jsons.map((json) => Todo.fromJSON(json)).toList();
  }
}
