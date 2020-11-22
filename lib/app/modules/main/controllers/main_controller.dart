import 'dart:async';

class MainController {

  StreamController _indexBottom = StreamController<int>.broadcast();

  Stream get indexBottomStream => _indexBottom.stream;

  void setIndex(int value) {
    _indexBottom.add(value);
  }

  void dispose() {
    _indexBottom.close();
  }
}