import 'package:flutter/material.dart';
import 'package:flutton/src/shimmering/values/avatar_position.dart';
import 'package:flutton/src/shimmering/values/type.dart';
import 'package:flutton/src/shimmering/values/type_list.dart';
import 'package:flutton/src/shimmering/widgets/circle.dart';
import 'package:flutton/src/shimmering/widgets/item-avatar.dart';
import 'package:flutton/src/shimmering/widgets/item-circle-avatar.dart';
import 'package:flutton/src/shimmering/widgets/item.dart';
import 'package:flutton/src/shimmering/widgets/line.dart';
import 'package:flutton/src/shimmering/widgets/rectangle.dart';
import 'package:flutton/src/shimmering/helpers/helpers.dart';

///
/// FluttonShimmering
/// is a widget to show a placeholder to the user before he got
/// the real data. This widget has many types, there are :
///
/// 1. Rectangle
/// 2. Circle
/// 3. Line
/// 4. List
///    1. List Line
///    2. List Item Avatar
///    3. List Item Circle Avatar
///
/// you just using what you want it, and throw it into your
/// screen. If you want to know more, please checkout the
/// examples folder.
///

class FluttonShimmering extends StatelessWidget with FluttonShimmeringHelpers {
  ///
  /// @param width => width rectangle
  /// @param height => height rectangle
  /// @param radius (optional) => radius for rectangle
  ///

  FluttonShimmering.rectangle({
    Key key,
    @required this.width,
    @required this.height,
    this.radius,
  })  : type = FluttonShimmeringType.RECTANGLE,
        super(key: key);

  ///
  /// @param width => width circle
  /// @param height => height circle
  ///

  FluttonShimmering.circle({
    Key key,
    @required this.width,
    @required this.height,
  })  : type = FluttonShimmeringType.CIRCLE,
        super(key: key);

  ///
  /// @param width => width line
  /// @param height => height line
  /// @param radius (optional) => radius for line
  ///

  FluttonShimmering.line({
    Key key,
    @required this.width,
    @required this.height,
    this.radius,
  })  : type = FluttonShimmeringType.LINE,
        super(key: key);

  ///
  /// @param count => count of list items
  /// @param countLine => each item, how many line you need
  /// @param widthAvatar => width avatar
  /// @param heightAvatar => height avatar
  /// @param widthLine => width rectangle
  /// @param heightLine => height rectangle
  /// @param radiusAvatar (optional) => radius for avatar
  /// @param radiusLine (optional) => radius for line
  /// @param lastWidthLine (optional) => width end line for each item
  /// @param avatarPosition (optional, by default on top) => position avatar each item
  /// @param typeList (optional) => what style you want to show for item inside list.
  /// Mix between line and avatar, or line and circle avatar or just line
  ///

  FluttonShimmering.list({
    Key key,
    @required this.count,
    @required this.countLine,
    @required this.widthLine,
    @required this.heightLine,
    @required this.widthAvatar,
    @required this.heightAvatar,
    this.radiusLine,
    this.radiusAvatar,
    this.lastWidthLine,
    this.avatarPosition = FluttonShimmeringAvatarPosition.TOP,
    this.typeList = FluttonShimmeringTypeList.ITEM,
  })  : type = FluttonShimmeringType.LIST,
        super(key: key);

  int count;
  int countLine;
  double width;
  double height;
  double radius;
  double lastWidthLine;
  double radiusLine;
  double widthLine;
  double heightLine;
  double radiusAvatar;
  double widthAvatar;
  double heightAvatar;
  FluttonShimmeringType type;
  FluttonShimmeringTypeList typeList;
  FluttonShimmeringAvatarPosition avatarPosition;

  List<Widget> _buildItemFluttonShimmering() {
    return List.generate(count, (int index) {
      if (typeList == FluttonShimmeringTypeList.ITEM) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 6),
          child: FluttonItemShimmering(
            countLine: countLine,
            widthLine: widthLine,
            heightLine: heightLine,
            lastWidthLine: determineValueByComparasion(index, count - 1)(
                lastWidthLine, widthLine),
          ),
        );
      } else if (typeList == FluttonShimmeringTypeList.ITEM_AVATAR) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: FluttonItemAvatarShimmering(
            heightAvatar: heightAvatar,
            widthAvatar: widthAvatar,
            countLine: countLine,
            radiusAvatar: radius,
            radiusLine: radiusLine,
            widthLine: widthLine,
            heightLine: heightLine,
            avatarPosition: avatarPosition,
            lastWidthLine: determineValueByComparasion(index, count - 1)(
                lastWidthLine, widthLine),
          ),
        );
      }
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: FluttonItemCircleAvatarShimmering(
          heightAvatar: heightAvatar,
          widthAvatar: widthAvatar,
          countLine: countLine,
          radiusLine: radiusLine,
          widthLine: widthLine,
          heightLine: heightLine,
          avatarPosition: avatarPosition,
          lastWidthLine: determineValueByComparasion(index, count - 1)(
              lastWidthLine, widthLine),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (type == FluttonShimmeringType.RECTANGLE) {
      return FluttonRectangleShimmering(
        width: width,
        radius: radius,
        height: height,
      );
    } else if (type == FluttonShimmeringType.CIRCLE) {
      return FluttonCircleShimmering(
        width: width,
        height: height,
      );
    } else if (type == FluttonShimmeringType.LINE) {
      return FluttonLineShimmering(
        width: width,
        height: height,
        radius: radius,
      );
    }
    return ListView(
      shrinkWrap: true,
      children: _buildItemFluttonShimmering(),
    );
  }
}
