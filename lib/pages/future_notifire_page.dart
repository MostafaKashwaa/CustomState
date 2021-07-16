import 'package:flutter/material.dart';
import 'package:manual_observer/counter_view_model.dart';
import 'package:manual_observer/listener_widgets/future_listener_widget.dart';
import 'package:manual_observer/listener_widgets/value_listener_widget.dart';

class FutureNotifirePage extends StatelessWidget {
  final String title;
  final counterViewModel = CounterViewModel();

  FutureNotifirePage({Key? key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                FutureListenerWidget<int>(
                  notifier: counterViewModel.fCounter,
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
            ),
            ValueListenerWidget<ValueStatus>(
              notifier: counterViewModel.state,
              child: (value, context) {
                if (value == ValueStatus.Waiting) {
                  return Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: CircularProgressIndicator());
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
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              // counterViewModel.increment();
              counterViewModel.incrementAsync();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              counterViewModel.decrement();
            },
            tooltip: 'Decrement',
            child: Icon(Icons.horizontal_rule),
          ),
          FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Dialog"),
                      content: Column(
                        children: [
                          ValueListenerWidget<int>(
                            notifier: counterViewModel.counter,
                            child: (value, context) => Column(
                              children: [
                                Text(
                                  '$value',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  counterViewModel.increment();
                                },
                                tooltip: 'Increment',
                                child: Icon(Icons.add),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  counterViewModel.decrement();
                                },
                                tooltip: 'Decrement',
                                child: Icon(Icons.horizontal_rule),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            },
            tooltip: 'Decrement',
            child: Icon(Icons.dialpad_rounded),
          ),
        ],
      ),
    );
  }
}
