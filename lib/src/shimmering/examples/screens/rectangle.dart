import 'package:flutter/material.dart';
import 'package:flutton/src/shimmering/helpers/helpers.dart';
import 'package:flutton/src/shimmering/shimmering.dart';

///
/// Simple Using FluttonShimerringRectangle
///

class RectangleScreen extends StatefulWidget with FluttonShimmeringHelpers {
  @override
  _RectangleScreenState createState() => _RectangleScreenState();
}

class _RectangleScreenState extends State<RectangleScreen> {
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
          FluttonShimmering.rectangle(
            width: 48,
            height: 48,
            radius: 5,
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
