import 'package:flutter/material.dart';
import 'package:flutton/src/shimmering/values/value.dart';
import 'package:shimmer/shimmer.dart';

class FluttonRectangleShimmering extends StatelessWidget {
  ///
  /// @param width => width rectangle
  /// @param height => height rectangle
  /// @param radius (optional) => radius for rectangle
  ///
  FluttonRectangleShimmering({
    Key key,
    @required this.width,
    @required this.height,
    this.radius,
  })  : _radius = radius == null
            ? BorderRadius.circular(defaultRadius)
            : BorderRadius.circular(radius),
        super(key: key);

  final double width;
  final double height;
  final double radius;

  BorderRadius _radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[200],
      direction: ShimmerDirection.ltr,
      period: Duration(seconds: 1),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: _radius,
        ),
      ),
    );
  }
}
