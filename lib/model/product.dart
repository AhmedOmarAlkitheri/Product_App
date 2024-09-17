class Product {
  late int id;
  late String title, description;
  late int price;
  late bool isFavortie = false;
  List<String> image = [];
  late String? img;
  Product({
    required this.id,
    required this.title,
    required this.price,
    // required this.image,
    required this.img,
    required this.isFavortie,
    this.description = "",
  });

  Product.fromMap(Map<String, dynamic> row) {
    id = row['id'];
    title = row['title'];
    price = row['price'];
    description = row['description'];

    image = row['images'];
    /* id = row["id"];
    title = row["title"];
    description = row["description"];
    price = row["price"];
    image = row["images"];*/
    // isFavortie = isFavortie1;
  }
  Product.fromrow(Map<String, dynamic> row) {
    id = row['id'];
    title = row['title'];
    price = row['price'].toDouble();
    description = row['description'];

    img = row['image'];
    // rating = row['rating'] != null ? Rating.fromrow(row['rating']) : null;
  }
}
