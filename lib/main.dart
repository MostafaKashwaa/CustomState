import 'package:flutter/material.dart';
import 'package:manual_observer/pages/future_observable_page.dart';
import 'package:manual_observer/pages/value_notifier_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FutureNotifierPage(title: 'Future Notifier Page'),
      // home: ValueNotifierPage(title: 'Value Notifier Page'),
      home: FutureObservablePage(title: 'Value Observable Page'),
    );
  }
}
