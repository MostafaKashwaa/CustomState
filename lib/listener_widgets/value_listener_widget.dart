import 'package:flutter/material.dart';

class ValueListenerWidget<T> extends StatefulWidget {
  final ValueNotifier notifier;
  final Widget Function(T, BuildContext) child;

  ValueListenerWidget({required this.notifier, required this.child});

  @override
  State<StatefulWidget> createState() => _ValueListenerWidgetState<T>();
}

class _ValueListenerWidgetState<T> extends State<ValueListenerWidget<T>> {
  late T value;

  void listener() {
    setState(() {
      value = widget.notifier.value;
    });
  }

  @override
  void initState() {
    super.initState();
    value = widget.notifier.value;
    widget.notifier.addListener(listener);
  }

  @override
  void didUpdateWidget(ValueListenerWidget<T> oldWidget) {
    if (oldWidget.notifier != widget.notifier) {
      oldWidget.notifier.removeListener(listener);
      value = widget.notifier.value;
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
