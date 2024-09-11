import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, "/Login");
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromARGB(248, 18, 0, 0),
          const Color.fromARGB(255, 179, 117, 66),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
            child: Image.asset(
          "assets/images/1.png",
          width: 200,
          height: 200,
        )),
      ),
    );
  }
}
