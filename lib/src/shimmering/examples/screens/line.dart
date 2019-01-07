import 'package:flutter/material.dart';
import 'package:flutton/src/shimmering/helpers/helpers.dart';
import 'package:flutton/src/shimmering/shimmering.dart';

///
/// Simple Using FluttonShimerringLine
///

class LineScreen extends StatefulWidget with FluttonShimmeringHelpers {
  @override
  _LineScreenState createState() => _LineScreenState();
}

class _LineScreenState extends State<LineScreen> {
  bool _loading;

  @override
  void initState() {
    _loading = true;
    _stopLoadingAfterThreeSecond();
    super.initState();
  }

  void _stopLoadingAfterThreeSecond() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Flutton Shimerring'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: widget.determineValueByComparasion<bool, bool>(_loading, true)(
          FluttonShimmering.line(
            width: double.infinity,
            height: 12,
          ),
          Text('helo world'),
        ),
      ),
    );
  }
}
