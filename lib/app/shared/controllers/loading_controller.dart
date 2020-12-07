import 'dart:async';

class LoadingController {

  StreamController _streamLoading = StreamController<bool>.broadcast();

  Stream get loading => _streamLoading.stream;

  void setLoading(bool value) {
    _streamLoading.add(value);
  }

  void dispose() {
    _streamLoading.close();
  }
}