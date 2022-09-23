import 'dart:async';

main() {
  myStreamFunction().listen((e) {
    print(e);
  });

  StreamController _myStreamController = StreamController();
  void functionForStreamController() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      _myStreamController.sink.add(i + 1);
    }
  }

  functionForStreamController();

  _myStreamController.stream.listen((event) {
    print(event * 10);
  },
  onDone: () {
    print('stream listen içerisinde ondone fonksiyonunu çalıştırdı');
  });
}
Stream<int> myStreamFunction() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i + 1;
  }
}

