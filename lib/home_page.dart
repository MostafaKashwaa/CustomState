import 'package:flutter/material.dart';
import 'package:manual_observer/CounterWidget.dart';
import 'package:manual_observer/counter_view_model.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final String title;
  int count = 0;

  final counterViewModel = CounterViewModel(0);
  HomePage({Key? key, required this.title}) {
    counterViewModel.addListener(() {
      count = counterViewModel.value;
      // counterObserver();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // CounterWidget(
            //   value: count,
            // )
            // counterObserver(),
            // ValueListenableBuilder(
            //   valueListenable: counterViewModel,
            //   builder: (BuildContext context, value, Widget? child) {
            //     return Text(
            //       '$value',
            //       // '$_counter',
            //       style: Theme.of(context).textTheme.headline4,
            //     );
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              count++;
              counterViewModel.increment();
              print(count);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              count--;
              counterViewModel.decrement();

              print(count);
            },
            tooltip: 'Decrement',
            child: Icon(Icons.horizontal_rule),
          ),
        ],
      ),
    );
  }
}
