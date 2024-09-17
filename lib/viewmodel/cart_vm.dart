import 'package:product_app/model/product.dart';

class Cart_VM {
  static List<Map<Product, int>> cards = [];
  List<Map<Product, int>> cards1 = [];
  static late int total = 0, qauntity = 0;
  List<Map<Product, int>> addToCard(Product p, int qty) {
    int q = 0;
    for (var i = 0; i < cards.length; i++) {
      if (cards[i].keys.first == p) {
        q = cards[i].values.first + qty;
        calcPrice(p, qty);
        calcQauntity(qty);
        cards.remove(cards[i]);
        //  p.price = p.price * q;
        cards.add({p: q});
        q = 0;
        cards1.add({p: q});
      }
    }
    if (cards1.isEmpty) {
      cards.add({p: qty});
      calcPrice(p, qty);
      calcQauntity(qty);
    }
    cards1 = [];

    return cards;
  }

  calcPrice(Product p, int qty) {
    total += p.price * qty;
  }

  calcQauntity(int qty) {
    qauntity += qty;
  }
}
