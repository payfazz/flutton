import 'package:flutter/material.dart';
import 'package:flutton/src/bulod/value/type.dart';
import 'package:flutton/src/bulod/widgets/loading_modal.dart';

///
/// FluttonBulod
/// is a widget, will be used to show loading indicator
/// when user tap the button. This widget, need loading
/// value for trigger to update ui
///
class FluttonBulod extends StatefulWidget {
  ///
  /// @param color => Color of button
  /// @param child => Widget inside the button, example we want
  /// to show label at button.
  /// @param loading => boolean for trigger update ui
  /// @param onPress => Action after button clicked
  /// @param contentLoading => Override the loading widget, with the existing
  /// @param disabled => boolean for disabled button
  /// @param type => FluttonBulodType.BASIC | FluttonBulodType.MODAL (show loading indicator using modal)
  ///
  FluttonBulod({
    Key key,
    @required this.color,
    @required this.child,
    @required this.loading,
    @required this.onPressed,
    this.contentLoading,
    this.disabled = false,
    this.type = FluttonBulodType.BASIC,
  }) : super(key: key);

  final bool loading;
  final bool disabled;
  final Color color;
  final Widget child;
  final Function onPressed;
  final Widget contentLoading;
  final FluttonBulodType type;

  @override
  _FluttonBulodState createState() => _FluttonBulodState();
}

class _FluttonBulodState extends State<FluttonBulod> {
  ///
  /// didUpdateWidget
  /// is the lifecycle who called, when the props or state
  /// updated. In this part, we will check if the previous
  /// value loading is false and current value is true. Then
  /// the type of button is FluttonBulodType.MODAL, then we
  /// should close the modal using navigator back
  ///
  @override
  void didUpdateWidget(FluttonBulod oldWidget) {
    if (oldWidget.loading != widget.loading &&
        widget.loading == false &&
        widget.type == FluttonBulodType.MODAL) {
      Future.delayed(
        Duration(milliseconds: 500),
        () => Navigator.of(context).pop(),
      );
    }

    super.didUpdateWidget(oldWidget);
  }

  ///
  /// _showLoadingModal
  ///
  void _showLoadingModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) =>
          FluttonLoadingModal(content: widget.contentLoading),
    );
  }

  Widget _buildChild() {
    if (widget.type == FluttonBulodType.BASIC &&
        widget.contentLoading == null &&
        widget.loading) {
      return Container(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else if (widget.type == FluttonBulodType.BASIC &&
        widget.contentLoading != null &&
        widget.loading) {
      return widget.contentLoading;
    }

    return widget.child;
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: widget.color,
      child: _buildChild(),
      onPressed: widget.loading || widget.disabled
          ? null
          : () {
              if (widget.type == FluttonBulodType.MODAL) {
                _showLoadingModal(context);
              }
              widget.onPressed();
            },
    );
  }
}
