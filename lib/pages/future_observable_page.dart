import 'package:flutter/material.dart';
import 'package:manual_observer/counter_view_model.dart';
import 'package:manual_observer/infrastructure/future_widget.dart';
import 'package:manual_observer/listener_widgets/future_listener_widget.dart';
import 'package:manual_observer/listener_widgets/value_listener_widget.dart';
import 'package:manual_observer/view/components/counter_buttons.dart';
import 'package:manual_observer/view/components/counter_dialog.dart';

class FutureObservablePage extends StatelessWidget {
  final String title;
  final counterViewModel = CounterViewModel();

  FutureObservablePage({Key? key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureCounterScreen(counterViewModel: counterViewModel),
      floatingActionButton:
          FutureCounterButtons(counterViewModel: counterViewModel),
    );
  }
}

class FutureCounterScreen extends StatelessWidget {
  const FutureCounterScreen({
    Key? key,
    required this.counterViewModel,
  }) : super(key: key);

  final CounterViewModel counterViewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times:',
              ),
              FutureWidget<int>(
                initialValue: 1,
                observable: counterViewModel.oCounter,
                child: (value, context) => Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
          ValueListenerWidget<ValueStatus>(
            notifier: counterViewModel.state,
            child: (value, context) {
              if (value == ValueStatus.Waiting) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()]);
              } else {
                return Container(
                  width: 0,
                  height: 0,
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class FutureCounterButtons extends StatelessWidget {
  const FutureCounterButtons({
    Key? key,
    required this.counterViewModel,
  }) : super(key: key);

  final CounterViewModel counterViewModel;

  @override
  Widget build(BuildContext context) {
    return CounterButtons(
        onIncrement: counterViewModel.incrementObservableAsync,
        onDecrement: counterViewModel.decrementObservableAsync,
        onOpen: () => {
              showDialog(
                  context: context,
                  builder: (context) => CounterDialog(
                        notifier: counterViewModel.counter,
                        onIncrement: () => counterViewModel.increment(),
                        onDecrement: () => counterViewModel.decrement(),
                      ))
            });
  }
}
