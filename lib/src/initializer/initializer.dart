import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutton/src/initializer/helpers/compose_widget.dart';
import 'package:flutton/src/initializer/helpers/errors_iterator.dart';
import 'package:flutton/src/initializer/model/initializer.dart';
import 'package:flutton/src/initializer/values/type.dart';

///
/// FluttonInitializer
/// is the widget who will handle your http request
/// and also render it to the ui. This widget can be also handle the error
/// and give loading indicator to give user feedback. This version just support two
/// types of state management (stream and local state)
///
@immutable
class FluttonInitializer<T> extends StatefulWidget
    with ComposeWidget, ErrorsIterator {
  ///
  /// @param Function (required) => fill with your http request
  /// @param onError => widget will be display, when error happen
  /// @param onLoading => widget will be display, when start http request
  /// @param errorListener => if error happen, you should do something based
  /// on your error message, so this is the right place
  /// @param builder => result of this widget (include data)
  ///

  final Function request;
  final Widget onError;
  final Widget onLoading;
  final List<Function(BuildContext, dynamic, Function)> errorListener;
  final Function(BuildContext, FluttonInitializerModel<T>) builder;

  FluttonInitializerType _type;
  StreamController _controller;

  FluttonInitializer({
    Key key,
    this.onError,
    this.onLoading,
    this.errorListener,
    @required this.request,
    @required this.builder,
  })  : _type = FluttonInitializerType.USING_STATE,
        super(key: key);

  ///
  /// @param controller (required) => a stream controller, throw the controller here
  /// and we will control the stream as well
  ///
  FluttonInitializer.stream({
    this.onError,
    this.onLoading,
    this.errorListener,
    @required this.request,
    @required this.builder,
    @required StreamController controller,
  }) {
    _controller = controller;
    _type = FluttonInitializerType.STREAM;
  }

  @override
  _FluttonStreamInitializer<T> createState() => _FluttonStreamInitializer<T>();
}

class _FluttonStreamInitializer<T> extends State<FluttonInitializer<T>> {
  T _data;
  bool _error;
  bool _loading;
  FluttonInitializerModel<T> _model;

  _FluttonStreamInitializer() {
    _model = FluttonInitializerModel<T>.empty();
  }

  @override
  void initState() {
    _data = null;
    _error = false;
    _loading = false;

    _fetchInitialData();
    super.initState();
  }

  Future<void> _fetchInitialData() async {
    try {
      _setLoading(true);
      final T response = await widget.request();
      _setResult(response);
    } catch (e) {
      _setError(true, e);
      widget.scan(context, widget.errorListener, e);
    }
  }

  ///
  /// _setLoading | _setError | _setResult
  /// will handle the state, based on the type widget will be use.
  /// If user choose to using state widget, so we have to handle
  /// the changes of state and if user using stream, we will handle too
  ///
  void _setLoading(bool _newLoading) {
    if (widget._type == FluttonInitializerType.USING_STATE) {
      setState(() {
        _loading = _newLoading;
        _error = false;
      });
    }
  }

  void _setError(bool _newError, dynamic e) {
    if (widget._type == FluttonInitializerType.USING_STATE) {
      setState(() {
        _error = _newError;
        _loading = false;
      });
    } else {
      widget._controller.sink.addError(e);
    }
  }

  void _setResult(T result) {
    if (widget._type == FluttonInitializerType.USING_STATE) {
      setState(() {
        _data = result;
      });
    } else {
      widget._controller.sink.add(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (null == widget._controller) {
      _model = FluttonInitializerModel<T>(
        loading: _loading,
        hasError: _error,
        data: _data,
      );

      return Container(
        child: Builder(
          builder: (BuildContext ctx) {
            return widget.compose(_loading, _error)(
              widget.onLoading,
              widget.onError,
              widget.builder(ctx, _model),
            );
          },
        ),
      );
    }

    return Container(
      child: StreamBuilder<T>(
        stream: widget._controller.stream,
        builder: (BuildContext ctx, AsyncSnapshot<T> snapshot) {
          bool loading = !snapshot.hasData;
          bool hasError = snapshot.error != null;
          _model = FluttonInitializerModel<T>(
            loading: loading,
            hasError: hasError,
            data: snapshot.data,
          );

          return widget.compose(loading, hasError)(
              widget.onLoading, widget.onError, widget.builder(ctx, _model));
        },
      ),
    );
  }
}
