import 'package:flutter/material.dart';
import 'package:flutton/src/bulod/bulod.dart';
import 'package:flutton/src/bulod/value/type.dart';

class BulodScreen extends StatefulWidget {
  @override
  _BulodScreenState createState() => _BulodScreenState();
}

class _BulodScreenState extends State<BulodScreen> {
  bool loading;

  @override
  void initState() {
    loading = false;
    super.initState();
  }

  void updateLoading() {
    setState(() {
      loading = !loading;
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        loading = !loading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Bulod'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FluttonBulod(
            loading: loading,
            color: Colors.red,
            child: Text('Coba'),
            onPressed: updateLoading,
            contentLoading: Text('loading ya'),
          ),
          FluttonBulod(
            loading: loading,
            color: Colors.red,
            child: Text('Coba'),
            onPressed: updateLoading,
            type: FluttonBulodType.MODAL,
          ),
        ],
      ),
    );
  }
}
