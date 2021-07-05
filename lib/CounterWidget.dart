import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CounterWidget extends StatefulWidget {
  // static _CounterWidgetState? of(BuildContext context) =>
  //     context.findAncestorStateOfType<_CounterWidgetState>();

  Function changeValue = (int value) {};

  CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState(changeValue);
}

class _CounterWidgetState extends State<CounterWidget> {
  int value = 0;

  _CounterWidgetState(Function onValueChange);
  @override
  Widget build(BuildContext context) {
    return Text(
      '${this.value}',
    );
  }

  void handleUpdate(int value) {
    setState(() {
      this.value = value;
    });
  }
}
