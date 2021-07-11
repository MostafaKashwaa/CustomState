import 'package:flutter/material.dart';

class ListenerWidget<T> extends StatefulWidget {
  final ValueNotifier notifier;
  final Widget Function(T, BuildContext) child;

  ListenerWidget({required this.notifier, required this.child});

  @override
  State<StatefulWidget> createState() => _ListenerWidgetState<T>();
}

class _ListenerWidgetState<T> extends State<ListenerWidget<T>> {
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
  void didUpdateWidget(ListenerWidget<T> oldWidget) {
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
}
