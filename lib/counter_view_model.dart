import 'package:flutter/foundation.dart';

class CounterViewModel {
  ValueNotifier<int> counter = ValueNotifier(0);
  ValueNotifier<ValueStatus> state = ValueNotifier(ValueStatus.Idle);

  void increment() async {
    state.value = ValueStatus.Waiting;
    await Future.delayed(Duration(milliseconds: 2000));
    state.value = ValueStatus.Success;
    counter.value++;
  }

  void decrement() {
    counter.value--;
  }
}

enum ValueStatus { Idle, Success, Waiting, Failed }

// class CounterViewModel extends ValueNotifier<int> {
//   CounterViewModel(value) : super(value);
//
//   void increment() {
//     value++;
//   }
//
//   void decrement() {
//     value--;
//   }
// }
