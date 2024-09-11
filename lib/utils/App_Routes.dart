import 'package:flutter/material.dart';
import 'package:product_app/model/product.dart';
import 'package:product_app/views/IncreamentScreen.dart';
import 'package:product_app/views/Login.dart';
import 'package:product_app/views/Order.dart';
import 'package:product_app/views/cardView.dart';
import 'package:product_app/views/details.dart';
import 'package:product_app/views/productView.dart';
import 'package:product_app/views/splash_screen.dart';

class AppRoutes {
  static Route<dynamic>? routeManager(RouteSettings Setting) {
    switch (Setting.name) {
      case "/Login":
        return MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        );

      case "/home":
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );

      case "/details":
        return MaterialPageRoute(
            builder: (context) {
              return DetailsScreen(
                p: Setting.arguments as Product,
              );
            },
            settings: Setting);

      case "/card":
        return MaterialPageRoute(
            builder: (context) {
              return CartScreen();
            },
            settings: Setting);

      case "/order":
        return MaterialPageRoute(
          builder: (context) {
            return Order();
          },
        );
      case "/increament":
        return MaterialPageRoute(
          builder: (context) {
            return IncreamentScreen();
          },
        );
      case "/splash_screen":
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );
    }
  }
}
