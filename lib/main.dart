import 'package:flutter/material.dart';
import 'package:manual_observer/pages/future_notifire_page.dart';
import 'package:manual_observer/pages/value_notifire_page.dart';

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
      // home: FutureNotifierPage(title: 'Flutter Demo Home Page'),
      home: ValueNotifierPage(title: 'Flutter Demo Home Page'),
    );
  }
}
