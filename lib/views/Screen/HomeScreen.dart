import 'package:flutter/material.dart';
import 'package:product_app/DB/DB_Product.dart';
import 'package:product_app/views/Screen/productView.dart';
import 'package:product_app/views/Screen/productView1.dart';

class Home extends StatelessWidget {
  Home({super.key});
  DbProduct db = DbProduct();
  int tablet = 600;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.getProducts(),
      builder: (context, snapshot) {
        return LayoutBuilder(builder: (context, constraints) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (constraints.maxWidth < tablet) {
              return HomeScreen();
            } else {
              return HomeScreentwo(products: snapshot.data);
              //  return HomeScreen(products: snapshot.data);
            }
          } else {
            return CircularProgressIndicator();
          }
        });
      },
    );
  }
}
