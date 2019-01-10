import 'dart:math';

import 'package:rxdart/rxdart.dart';

///
/// MixNameBloc
/// example of using fluttoncuknav
class MixNameBloc {
  final List<String> _names = [
    'atin',
    'kondel',
    'hantze',
    'sebo',
    'chris',
    'gir'
  ];

  BehaviorSubject<String> _namesController =
      BehaviorSubject<String>(seedValue: 'atin');
  Stream<String> get name => _namesController.stream;

  void mixName() {
    Random r = Random();
    final int numb = r.nextInt(5);
    _namesController.sink.add(_names[numb]);
  }
}
