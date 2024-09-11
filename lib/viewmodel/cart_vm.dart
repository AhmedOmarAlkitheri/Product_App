import 'package:product_app/model/product.dart';

class Cart_VM {
  static List<Map<Product, int>> cards = [];
  static late int total = 0, qauntity = 0;
  List<Map<Product, int>> addToCard(Product p, int qty) {
    cards.add({p: qty});
    calcPrice(p, qty);
    calcQauntity(qty);
    return cards;
  }

  calcPrice(Product p, int qty) {
    total += p.price * qty;
  }

  calcQauntity(int qty) {
    qauntity += qty;
  }
}
