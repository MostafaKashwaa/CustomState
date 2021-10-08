import 'package:flutter/foundation.dart';
import 'package:manual_observer/infrastructure/observable.dart';
import 'package:manual_observer/listener_widgets/future_notifier.dart';

class CounterViewModel {
  ValueNotifier<int> counter = ValueNotifier(0);
  ValueNotifier<ValueStatus> state = ValueNotifier(ValueStatus.Idle);
  FutureNotifier<Future<int>> fCounter = FutureNotifier();
  Observable<Future<int>> oCounter = Observable();

  int testCounter = 0;

  void increment() async {
    state.value = ValueStatus.Waiting;
    await Future.delayed(Duration(milliseconds: 2000));
    state.value = ValueStatus.Success;
    counter.value++;
  }

  void decrement() {
    counter.value--;
  }

  CounterViewModel() {
    // fCounter.setValue(_createIncrementFuture());
    oCounter.setValue(Future(() => 0));
  }

  void incrementAsync() => {};//fCounter.setValue(_createIncrementFuture());
  void decrementAsync() => {};//fCounter.setValue(_createDecrementFuture());

  void incrementObservableAsync() => oCounter.setValue(_createIncrementFuture());
  void decrementObservableAsync() => oCounter.setValue(_createDecrementFuture());

  Future<int> _createIncrementFuture() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return ++testCounter;
  }

  Future<int> _createDecrementFuture() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return --testCounter;
  }

  // void getData() async {}
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
