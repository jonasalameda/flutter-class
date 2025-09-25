import 'dart:async';

void main() {
  final controller = StreamController<int>();
  controller.stream.listen((value) {
    print(value);
  });

  // generateNumbers(controller);

  Future.delayed(Duration(seconds: 11), () {
    controller.close();
  });
}