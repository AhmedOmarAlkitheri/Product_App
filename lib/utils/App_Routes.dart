import 'package:flutter/material.dart';
import 'package:product_app/model/product.dart';
import 'package:product_app/views/IncreamentScreen.dart';
import 'package:product_app/views/Screen/Favorite.dart';
import 'package:product_app/views/Screen/HomeScreen.dart';
import 'package:product_app/views/Screen/Login.dart';
import 'package:product_app/views/Screen/Order.dart';
import 'package:product_app/views/Screen/cardView.dart';
import 'package:product_app/views/Screen/details.dart';
import 'package:product_app/views/Screen/splash_screen.dart';

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
            return Home();
          },
        );
      /*  builder: (context) {
              return HomeScreen( products: Setting.arguments as List <Product>,);
            },
            settings: Setting);
          */

      case "/Favorite":
        return MaterialPageRoute(
          builder: (context) {
            return Favorite();
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
      // default:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return SplashScreen();
      //     },
      //   );
    }
  }
}
