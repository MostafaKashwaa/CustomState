import 'package:flutter/material.dart';
import 'package:manual_observer/listener_widgets/future_notifier.dart';

class FutureListenerWidget<T> extends StatefulWidget {
  final FutureNotifier notifier;
  final Widget Function(T, BuildContext) child;

  FutureListenerWidget({required this.notifier, required this.child});

  @override
  State<StatefulWidget> createState() => _FutureListenerWidgetState<T>();
}

class _FutureListenerWidgetState<T> extends State<FutureListenerWidget<T>> {
  late T value;

  void listener() {
    setState(() {
      value = widget.notifier.valueSnapshot;
    });
  }

  @override
  void initState() {
    super.initState();
    value = widget.notifier.valueSnapshot;
    widget.notifier.addListener(listener);
  }

  @override
  void didUpdateWidget(FutureListenerWidget<T> oldWidget) {
    if (oldWidget.notifier != widget.notifier) {
      oldWidget.notifier.removeListener(listener);
      value = widget.notifier.valueSnapshot;
      widget.notifier.addListener(listener);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child(value, context);
  }

  @override
  void dispose() {
    widget.notifier.removeListener(listener);
    super.dispose();
  }
}
