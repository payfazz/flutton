import 'package:flutter/material.dart';
import 'package:flutton/src/initializer/examples/model/todo.dart';
import 'package:flutton/src/initializer/initializer.dart';
import 'package:flutton/src/initializer/model/initializer.dart';
import 'package:dio/dio.dart';

///
/// Simple Using FluttonInitializer
///

class TodosScreen extends StatelessWidget {
  Dio _client;

  TodosScreen() {
    _client = Dio();
  }

  Future<List<Todo>> _getTodos() async {
    final Response resp =
        await _client.get('https://jsonplaceholder.typicode.com/todos');
    return Todo.fromListJSON(resp.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Flutton Initializer'),
      ),
      body: FluttonInitializer<List<Todo>>(
        request: _getTodos,
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
        onError: Center(
          child: Text("Terjadi Kesalahan"),
        ),
        builder: (BuildContext ctx, FluttonInitializerModel<List<Todo>> model) {
          return ListView.builder(
            itemCount: model?.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Text(model.data[index].title),
              );
            },
          );
        },
      ),
    );
  }
}
