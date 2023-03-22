import '../custom_grid_tile.dart';

enum RefreshingStates { refreshing }

int state_(RefreshingStates state) {
  return state.index;
}

class RefreshingState {
  final RefreshingStates _state;
  List<CustomGridTile>? _data = [];


  RefreshingState(this._state) {
    _data?.clear();
  }

  RefreshingStates state() {
    return _state;
  }
  
  void setData(List<CustomGridTile>? data) {
    _data = data;
  }

  List<CustomGridTile>? data() {
    return _data;
  }
}
