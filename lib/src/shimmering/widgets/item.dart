import 'package:flutter/material.dart';
import 'package:flutton/src/shimmering/values/value.dart';
import 'package:flutton/src/shimmering/widgets/line.dart';
import 'package:flutton/src/shimmering/helpers/helpers.dart';

class FluttonItemShimmering extends StatelessWidget
    with FluttonShimmeringHelpers {
  ///
  /// @param countLine => each item, how many line you need
  /// @param widthLine => width rectangle
  /// @param heightLine => height rectangle
  /// @param radiusLine (optional) => radius for line
  /// @param lastWidthLine (optional) => width end line for each item
  ///
  FluttonItemShimmering({
    Key key,
    @required this.widthLine,
    @required this.heightLine,
    this.countLine = defaultCountLine,
    this.radiusLine,
    this.lastWidthLine,
  })  : _lastWidthLine = lastWidthLine == null ? widthLine : lastWidthLine,
        super(key: key);

  final double radiusLine;
  final int countLine;
  final double widthLine;
  final double heightLine;
  final double lastWidthLine;
  double _lastWidthLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          countLine,
          (int index) => Container(
                margin: EdgeInsets.only(bottom: 4),
                child: FluttonLineShimmering(
                  width: determineValueByComparasion<int, int>(
                          index, countLine - 1)<double, double>(
                      widthLine, _lastWidthLine),
                  height: heightLine,
                  radius: radiusLine,
                ),
              ),
        ),
      ),
    );
  }
}
