class Product {
  late int id;
  late String title, description;
  late int price;
  late bool isFavortie = false;
  List<String> image = [];
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.isFavortie,
    this.description = "",
  });

  Product.fromMap(Map<String, dynamic> row) {
    id = row["id"];
    title = row["title"];
    description = row["description"];
    price = row["price"];
    image = row["images"];
    // isFavortie = isFavortie1;
  }
}
