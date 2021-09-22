import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../sample_widget.dart';
import 'counter_buttons.dart';

class CounterDialog extends StatelessWidget {
  const CounterDialog({
    Key? key,
    required this.notifier,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  final ValueNotifier notifier;
  final Function onIncrement;
  final Function onDecrement;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Dialog"),
      content: Column(
        children: [
          ListenerWidget<int>(
            notifier: notifier,
            child: (value, context) => Column(
              children: [
                Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          CounterButtons(
            onIncrement: onIncrement,
            onDecrement: onDecrement,
            onOpen: null,
          ),
        ],
      ),
    );
  }
}
