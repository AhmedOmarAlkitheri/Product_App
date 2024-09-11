import 'package:flutter/material.dart';

class IncreamentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Increament();
  }
}

class Increament extends State<IncreamentScreen> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            i++;
          });
        },
        child: Text("+"),
      ),
      body: Center(child: Text("$i")),
    );
  }
}
