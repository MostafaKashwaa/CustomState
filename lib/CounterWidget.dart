import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {

  late final int value;
  CounterWidget({Key? key, required this.value}) : super(key: key);

  @override
  ObserverState createState() => ObserverState(ValueNotifier(this.value));
}

class ObserverState extends State<CounterWidget> {
  int value = 0;

  ObserverState(ValueNotifier notifier) {
    notifier.addListener(() {
      setState(() {
        value = notifier.value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      '${this.value} Times',
    );
  }
}
