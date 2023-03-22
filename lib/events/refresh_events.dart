import '../events/event.dart';

class Refresh<T> extends Event<T> {
  T? _data;
  Refresh();
  @override
  T? getData() {
    return _data;
  }

  @override
  void setData([T? data]) {
    _data = data;
  }
}
