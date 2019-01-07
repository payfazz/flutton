import 'package:flutter/material.dart';
import 'package:flutton/flutton/bloc_provider.dart';
import 'package:flutton/flutton/stream_initializer.dart';
import 'package:flutton/src/view/home/bloc.dart';

class HomeScreen extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Home'),
      ),
      body: BlocBuilder<HomeBloc>(
        builder: (BuildContext context, HomeBloc bloc) => StreamInitializer(
              onInitState: () => bloc.fetchFavoriteStories.add(Null),
              builder: StreamBuilder(
                stream: bloc.favoriteStories,
                builder: (context, snapshot) => (snapshot.hasData)
                    ? Center(child: Text('test ${snapshot.data[0]}'))
                    : Center(child: CircularProgressIndicator()),
              ),
            ),
      ),
    );
  }
}
