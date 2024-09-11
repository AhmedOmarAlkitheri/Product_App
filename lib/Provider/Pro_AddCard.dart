import 'package:flutter/material.dart';
import 'package:product_app/model/product.dart';
import 'package:product_app/viewmodel/cart_vm.dart';

class ProAddcard extends ChangeNotifier {
  Cart_VM c_VM = Cart_VM();
  floatingAddCard(Product p, int count) {
    c_VM.addToCard(p, count);

    notifyListeners();
  }

  countProduct() {
    Cart_VM.cards.length;

    notifyListeners();
  }
}
