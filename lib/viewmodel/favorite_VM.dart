import 'package:product_app/model/product.dart';

class FavoriteVm {
  static List<Map<Product, bool>> fav = [];
  List<Map<Product, bool>> addFavorite(Product p, bool isfav) {
    fav.add({p: isfav});

    return fav;
  }

  List<Product> allproductFav() {
    return fav.map(
      (e) {
        return e.keys.first;
      },
    ).toList();
  }
}
