import 'package:flutter/material.dart';
import 'package:manual_observer/counter_view_model.dart';
import 'package:manual_observer/view/CounterScreen.dart';
import 'package:manual_observer/view/components/counter_buttons.dart';
import 'package:manual_observer/view/components/counter_dialog.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final String title;
  int count = 0;
  final counterViewModel = CounterViewModel();

  HomePage({Key? key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: CounterScreen(counterViewModel: counterViewModel),
      ),
      floatingActionButton: CounterButtons(
        onIncrement: () => counterViewModel.increment(),
        onDecrement: () => counterViewModel.decrement(),
        onOpen: () => buildCounterDialog(context),
      ),
    );
  }

  Future<dynamic> buildCounterDialog(BuildContext context) {
    return showDialog(
            context: context,
            builder: (context) {
              return CounterDialog(
                notifier: counterViewModel.counter,
                onIncrement: () => counterViewModel.increment(),
                onDecrement: () => counterViewModel.decrement(),
              );
            });
  }
}




