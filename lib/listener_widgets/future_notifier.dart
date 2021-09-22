import 'dart:async';

import 'package:flutter/foundation.dart';

class FutureNotifier<T extends Future> extends ChangeNotifier
    implements ValueListenable<T> {
  dynamic valueSnapshot = 0;
  // late T _value;

  /// Creates a [ChangeNotifier] that wraps this value.
  FutureNotifier() {
    _value = Future(() => 0) as T;
  }

  void setValue(T value) {
    _value = value;
    _value.then((value) {
      valueSnapshot = value;
      notifyListeners();
    }, onError: () {
      valueSnapshot = Error();
      notifyListeners();
    });
  }

  /// The current value stored in this notifier.
  ///
  /// When the value is replaced with something that is not equal to the old
  /// value as evaluated by the equality operator ==, this class notifies its
  /// listeners.
  @override
  T get value => _value;
  late T _value;
  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
