import 'package:flutter/material.dart';

///
/// FluttonLoadingModal
/// is a commong modal for show loading indicator
///
class FluttonLoadingModal extends StatefulWidget {
  ///
  /// @param onDismiss => Function will be called when modal is dismiss
  /// @param content (optional) => optional widget if you want to override
  /// content inside model
  ///
  FluttonLoadingModal({
    Key key,
    this.content,
    @required this.onDismiss,
  }) : super(key: key);

  final Widget content;
  final Function onDismiss;

  @override
  State<StatefulWidget> createState() => _FluttonLoadingModal();
}

class _FluttonLoadingModal extends State<FluttonLoadingModal> {
  @override
  void dispose() {
    widget.onDismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
        child: widget.content == null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Loading ...',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        decoration:
                            Theme.of(context).textTheme.body1.decoration,
                        fontStyle: Theme.of(context).textTheme.body1.fontStyle,
                      ),
                    ),
                  ),
                ],
              )
            : widget.content,
      ),
    );
  }
}
