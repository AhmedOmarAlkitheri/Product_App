import 'package:flutter/material.dart';
import 'package:product_app/model/product.dart';
import 'package:product_app/viewmodel/cart_vm.dart';
import 'package:product_app/viewmodel/favorite_VM.dart';
import 'package:product_app/viewmodel/viewmodelProduct.dart';
import 'package:product_app/views/Widget/BottomNavigationBar.dart';

class HomeScreentwo extends StatefulWidget {
  List<Product>? products;
  HomeScreentwo({super.key, required this.products});

  @override
  State<HomeScreentwo> createState() => _HomeScreenState();
}

ViewmodelProduct VM_Product = ViewmodelProduct();
//List<Product> allProduct = VM_Product.loadProduct();
List<IconData> fav = [];
FavoriteVm favorite_vm = FavoriteVm();

class _HomeScreenState extends State<HomeScreentwo> {
// late  bool fi ;
//    bool f = ;
  @override
  void initState() {
    fav.add(Icons.favorite_border);
    // fav.add(Icons.favorite_border);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomBar(),
        appBar: AppBar(
          title: Text(
            "Home Screen",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 12),
              child: InkWell(
                child: Badge(
                  child: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.white,
                  ),
                  label: Text("${Cart_VM.cards.length}"),
                  backgroundColor: Colors.orange[400],
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/card");
                },
              ),
            )
          ],
          //     backgroundColor: Colors.brown[500],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: ListView.builder(
            itemCount: widget.products!.length,
            itemBuilder: (ctx, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/details",
                      arguments: widget.products![index]);
                },
                child: Card(
                    margin:
                        EdgeInsets.only(left: 7, right: 7, bottom: 7, top: 7),
                    color: Colors.brown[200],
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 150,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[300],
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${widget.products![index].image}"),
                                          fit: BoxFit.fill)),
                                ),
                              ),

                              Positioned(
                                left: 7,
                                top: 7,
                                child: InkWell(
                                  child: Icon(
                                    Icons.add_shopping_cart_rounded,
                                    color: Colors.red,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      //  c_VM.addToCard(widget.products![index], 1);
                                    });
                                  },
                                ),
                              ),

                              Positioned(
                                right: 5,
                                top: 5,
                                // child: IconButton(
                                //     onPressed: () {
                                //       if (allProduct[index].isFavortie == false) {
                                //         allProduct[index].isFavortie = true;
                                //         fav[index] = Icons.favorite;
                                //         //  color: Colors.black,

                                //         // VM_Product.loadProduct(true);
                                //       } else if (allProduct[index].isFavortie ==
                                //           true) {
                                //         allProduct[index].isFavortie = false;
                                //         fav[index] = Icons.favorite_border;
                                //         // VM_Product.loadProduct(false);
                                //       }
                                //       setState(() {});
                                //     },
                                //     icon: allProduct[0].isFavortie == false
                                //         ? Icon(fav[0])
                                //         : Icon(fav[index])),

                                child: InkWell(
                                  child: widget.products![index].isFavortie ==
                                          false
                                      ? Icon(
                                          Icons.favorite_border,
                                          color: Colors.black,
                                        )
                                      : Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                  onTap: () {
                                    if (widget.products![index].isFavortie ==
                                        false) {
                                      widget.products![index].isFavortie = true;
                                      favorite_vm.addFavorite(
                                          widget.products![index],
                                          widget.products![index].isFavortie);

                                      //  VM_Product.loadProduct(true);
                                    } else if (widget
                                            .products![index].isFavortie ==
                                        true) {
                                      widget.products![index].isFavortie =
                                          false;
                                      //   VM_Product.loadProduct(false);
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              // Positioned(
                              //     left: -7,
                              //     top: -10,
                              //     child: CircleAvatar(
                              //       backgroundColor: Colors.orange[300],
                              //       child: Text(
                              //         "20%",
                              //         style: TextStyle(color: Colors.white),
                              //       ),
                              //     )),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                        "${widget.products![index].title}")),
                                Text(
                                  "${widget.products![index].price}\$",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              );
            },
          ),
        ));
  }
}
