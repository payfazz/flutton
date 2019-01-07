import 'package:flutter/material.dart';
import 'package:flutton/src/shimmering/helpers/helpers.dart';
import 'package:flutton/src/shimmering/shimmering.dart';

///
/// Simple Using FluttonShimerringCircle
///

class CircleScreen extends StatefulWidget with FluttonShimmeringHelpers {
  @override
  _CircleScreenState createState() => _CircleScreenState();
}

class _CircleScreenState extends State<CircleScreen> {
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
          FluttonShimmering.circle(
            width: 48,
            height: 48,
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
