import 'package:flutter/foundation.dart';

class CounterViewModel extends ValueNotifier<int> {
  CounterViewModel(value) : super(value);

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }
}
