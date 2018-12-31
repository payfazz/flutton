import 'package:flutter/material.dart';
import 'package:flutton/src/app.dart';
import 'package:flutton/src/config.dart';

void main() => runApp(Application(
      config: Config(baseUrl: 'https://hacker-news.firebaseio.com/'),
    ));
