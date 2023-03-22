class CustomGridTile {
  CustomGridTile(this.id, this.crossAxisCount, this.mainAxisCount);

  int _counter = 1;
  bool enable = true;
  final int id;
  final int crossAxisCount;
  final int mainAxisCount;

  void setEnable(bool enable_) {
    enable = enable_;
  }

  int next() {
    if (enable) {
      _counter++;
      if (_counter == 16) {
        _counter = 1;
      }
    }
    return (id + 1) * _counter;
  }
}
