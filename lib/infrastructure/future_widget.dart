import 'package:flutter/material.dart';
import 'package:manual_observer/infrastructure/observable.dart';

class FutureWidget<T> extends StatefulWidget {
  final Observable<Future<T>> observable;
  final Widget Function(T, BuildContext) child;
  final T initialValue;

  FutureWidget(
      {required this.observable,
      required this.child,
      required this.initialValue});

  @override
  State<StatefulWidget> createState() => _FutureWidgetState<T>(initialValue);
}

class _FutureWidgetState<T> extends State<FutureWidget<T>> {
  T? _value;
  late void Function(Future<T>) observer;

  _FutureWidgetState(this._value);

  void initObserver() {
    observer = (future) => future.then(
        (value) => setState(() => _value = value),
        onError: (error) => print(error));
  }

  @override
  void initState() {
    super.initState();
    // _value = widget.initialValue;
    initObserver();
    widget.observable.register(observer);
  }

  @override
  void didUpdateWidget(FutureWidget<T> oldWidget) {
    if (oldWidget.observable != widget.observable) {
      oldWidget.observable.unRegister(observer);
      widget.observable.register(observer);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child(_value ?? widget.initialValue, context);
  }

  @override
  void dispose() {
    widget.observable.unRegister(observer);
    super.dispose();
  }
}
