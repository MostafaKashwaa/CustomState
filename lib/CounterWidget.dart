// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class CounterWidget extends StatefulWidget {
//   // static _CounterWidgetState? of(BuildContext context) =>
//   //     context.findAncestorStateOfType<_CounterWidgetState>();

//   // Function changeValue = (int value) {};

//   final Function<Widget>(BuildContext c) x;

//   final int value;

//   CounterWidget({Key? key, required this.value, required this.x})
//       : super(key: key);

//   @override
//   _CounterWidgetState createState() => _CounterWidgetState();
// }

// class _CounterWidgetState extends State<CounterWidget> {
//   int value = 0;

//   @override
//   Widget build(BuildContext context) {
//     return widget.x();
//     // return Text(
//     //   '${this.value}',
//     // );
//   }

//   @override
//   void didUpdateWidget(covariant CounterWidget oldWidget) {
//     if (oldWidget.value != widget.value) {
//       value = widget.value;
//       handleUpdate(value);
//     }
//     super.didUpdateWidget(oldWidget);
//   }

//   void handleUpdate(int value) {
//     setState(() {
//       this.value = value;
//     });
//   }
// }
