import 'package:flutter/material.dart';
import 'package:product_app/utils/App_Routes.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/order",
      onGenerateRoute: AppRoutes.routeManager,

      //   home: HomeScreen(),
      // routes: {
      //   "/home": (ctx) => HomeScreen(),
      //   "/details": (ctx) => DetailsScreen(),
      // },
    );
  }
}
