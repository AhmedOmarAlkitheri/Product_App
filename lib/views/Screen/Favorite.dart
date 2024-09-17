import 'package:flutter/material.dart';
import 'package:product_app/model/product.dart';
import 'package:product_app/viewmodel/favorite_VM.dart';
import 'package:product_app/views/Widget/BottomNavigationBar.dart';

class Favorite extends StatefulWidget {
  Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  FavoriteVm f = FavoriteVm();

  @override
  Widget build(BuildContext context) {
    List<Product> allfav = f.allproductFav();
    print(allfav);
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          "Your Favorite",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: allfav.length,
        itemBuilder: (context, index) {
          return Card(
              margin: EdgeInsets.only(left: 7, right: 7, bottom: 7, top: 7),
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
                            width: 160,
                            height: 150,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300],
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${allfav[index].image[0]}"),
                                    fit: BoxFit.fill)),
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

                          child:
                              // InkWell(
                              // child: allProduct[index].isFavortie != false
                              //     ? Icon(
                              //         Icons.favorite_border,
                              //         color: Colors.black,
                              //       )
                              //     :
                              Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          //   onTap: () {
                          //     if (allProduct[index].isFavortie == false) {
                          //       allProduct[index].isFavortie = true;

                          //       //  VM_Product.loadProduct(true);
                          //     } else if (allProduct[index].isFavortie == true) {
                          //       allProduct[index].isFavortie = false;
                          //       //   VM_Product.loadProduct(false);
                          //     }
                          //     setState(() {});
                          //   },
                          // ),
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
                          Expanded(child: Text("${allfav[index].title}")),
                          Text(
                            "${allfav[index].price}\$",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
