import 'package:manual_observer/infrastructure/observer.dart';

class Observable<T> {
  late T _value;
  List<void Function(T)> observers = List.of({});

  void setValue(T value) {
    _value = value;
    notifyAll(value);
  }

  void register(void Function(T) observer) {
    observers.add(observer);
    observer(_value);
  }
  void unRegister(void Function(T) observer) => observers.remove(observer);

  void notifyAll(T value) => observers.forEach((observer) {
        observer(value);
      });
}

// class Observable<T> {
//   List<Observer<T>> observers = List.of({});
//
//   void register(Observer<T> observer) => observers.add(observer);
//
//   void unRegister(Observer<T> observer) => observers.remove(observer);
//
//   void notifyAll(T value) => observers.forEach((element) {
//     element.notify(value);
//   });
// }
