import 'package:flutter/material.dart';

class TestScaffold extends StatelessWidget {
  const TestScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: TestScreen(),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.cyanAccent,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Scaffold Example"),
      centerTitle: true,
      elevation: 7.0,
      actions: [
        IconButton(
            onPressed: () => debugPrint("Icon pressed"),
            icon: Icon(Icons.access_alarm))
      ],
    );
  }
}

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
          OutlinedButton(
            onPressed: () {},
            child: Text("Click me"),
          ),
          Text(
            "Hello Flutter!",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.blueGrey,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
                fontSize: 28.0),
          ),
          InkWell(
            child: Text("click me"),
            focusColor: Colors.redAccent,
            highlightColor: Colors.amberAccent,
            customBorder: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            onTap: () => debugPrint("Ink Well"),
          ),
          GestureDetector(
            onTap: () => {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text("Gesture Detector",),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
