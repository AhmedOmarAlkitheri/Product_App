import 'package:product_app/DB/DB_Product.dart';
import 'package:product_app/model/product.dart';

class ViewmodelProduct {
  DbProduct db = new DbProduct();
  List<Product> loadProduct() {
    return db.getProduct().map((e) {
      return Product.fromMap(e);
    }).toList();
  }
}
