import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({
    Key? key,
    required this.onIncrement,
    required this.onDecrement,
    required this.onOpen,
  }) : super(key: key);

  final Function onIncrement;
  final Function onDecrement;
  final Function? onOpen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          onPressed: () => onIncrement(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => onDecrement(),
          tooltip: 'Decrement',
          child: Icon(Icons.horizontal_rule),
        ),
        if (onOpen != null)
          FloatingActionButton(
            onPressed: () => onOpen!(),
            tooltip: 'Open Dialogue',
            child: Icon(Icons.arrow_upward_rounded),
          ),
      ],
    );
  }
}
