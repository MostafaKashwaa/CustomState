import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../counter_view_model.dart';
import '../sample_widget.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({
    Key? key,
    required this.counterViewModel,
  }) : super(key: key);

  final CounterViewModel counterViewModel;

  @override
  Widget build(BuildContext context) {
    return ListenerWidget<ValueStatus>(
      notifier: counterViewModel.state,
      child: (value, context) {
        if (value == ValueStatus.Waiting) {
          return buildProgressIndicator();
        } else {
          return buildCounterPreview(counterViewModel.counter);
        }
      },
    );
  }

  Column buildProgressIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [CircularProgressIndicator()],
    );
  }

  Widget buildCounterPreview(ValueNotifier counter) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You have pushed the button this many times:',
        ),
        ListenerWidget<int>(
          notifier: counter,
          child: (value, context) => Column(
            children: [
              Text(
                '$value',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
