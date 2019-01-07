import 'package:flutter/cupertino.dart';

///
/// ErrorsIterator
/// is the mixin class and used for scan list of errorlisteners will be given
/// from FluttonInitializer, to know what the ErrosIterator do please read the
/// explaination at the below :
///
/// 1. The ErrorsIterator using iterable array, to get iterator object
/// 2. When we get the iterator object, we can go to the next index
/// array without loop, just using the function .moveNext
/// 3. After we move to the next index, we can ge the value from there
/// 4. To do like that, we should using callback and we always passing the
/// iterator to know, what the latest index of iterable array we have
///
mixin ErrorsIterator {
  void scan(
      BuildContext ctx,
      List<Function(BuildContext, dynamic, Function)> errorsListener,
      dynamic error) {
    if (errorsListener.length > 0) {
      Iterator<Function(BuildContext, dynamic, Function)> iterator =
          errorsListener.iterator;
      _run(ctx, error, iterator);
    }
  }

  void _run(BuildContext ctx, dynamic error,
      Iterator<Function(BuildContext, dynamic, Function)> _iterator) {
    _iterator.moveNext();
    _iterator.current(ctx, error, () => _run(ctx, error, _iterator));
  }
}
