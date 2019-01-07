import 'package:meta/meta.dart';

///
/// FluttonInitializerModel
/// is the model will be deliver to the user when user
/// using the FluttonInitializer widget
///
class FluttonInitializerModel<T> {
  bool hasError;
  bool loading;
  T data;

  FluttonInitializerModel({
    @required this.hasError,
    @required this.loading,
    @required this.data,
  });

  FluttonInitializerModel.empty() {
    loading = false;
    hasError = false;
    data = null;
  }
}
