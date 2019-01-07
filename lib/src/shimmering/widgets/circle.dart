import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FluttonCircleShimmering extends StatelessWidget {
  ///
  /// @param width => width circle
  /// @param height => height circle
  ///
  FluttonCircleShimmering({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

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
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
