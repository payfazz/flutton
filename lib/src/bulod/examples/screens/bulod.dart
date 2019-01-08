import 'package:flutter/material.dart';
import 'package:flutton/src/bulod/bulod.dart';
import 'package:flutton/src/bulod/value/type.dart';

class BulodScreen extends StatefulWidget {
  @override
  _BulodScreenState createState() => _BulodScreenState();
}

class _BulodScreenState extends State<BulodScreen> {
  bool loading;
  bool loading2;

  @override
  void initState() {
    loading = false;
    loading2 = false;
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

  void updateLoading2() {
    setState(() {
      loading2 = !loading2;
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        loading2 = !loading2;
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
          Center(
            child: FluttonBulod(
              loading: loading,
              color: Colors.red,
              child: Text('Coba'),
              onPressed: updateLoading,
              contentLoading: Text('loading ya'),
            ),
          ),
          Center(
            child: FluttonBulod(
              loading: loading2,
              color: Colors.red,
              child: Text('Coba'),
              onPressed: updateLoading2,
              type: FluttonBulodType.MODAL,
            ),
          ),
        ],
      ),
    );
  }
}
