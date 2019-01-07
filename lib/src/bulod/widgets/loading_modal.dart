import 'package:flutter/material.dart';

class FluttonLoadingModal extends StatelessWidget {
  FluttonLoadingModal({
    Key key,
    this.content,
  }) : super(key: key);

  final Widget content;

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
        child: content == null
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
            : content,
      ),
    );
  }
}
