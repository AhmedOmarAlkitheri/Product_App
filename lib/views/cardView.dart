import 'package:flutter/material.dart';
import 'package:product_app/model/product.dart';
import 'package:product_app/viewmodel/cart_vm.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Cart_VM c_VM = Cart_VM();
    List<Map<Product, int>> allProductToCard = Cart_VM.cards;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Text(
          "Card",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 52),
                    color: Colors.orange[300],
                    width: MediaQuery.of(context).size.width,
                    height: 450,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.brown,
                                    offset: Offset(2, 2),
                                    blurRadius: 20)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Image.network(allProductToCard[index]
                                .keys
                                .toList()
                                .first
                                .image[0]),
                            title: Text(
                              "${allProductToCard[index].keys.toList().first.title}",
                              style: TextStyle(
                                  color: Colors.brown[500],
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Qauntity : ${allProductToCard[index].values}",
                              style: TextStyle(
                                  color: Colors.brown[500],
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Text(
                              "${allProductToCard[index].keys.toList().first.price} \$",
                              style: TextStyle(
                                  color: Colors.brown[500],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                      itemCount: allProductToCard.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 2,
                          color: Colors.grey[400],
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 400,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.brown[500],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 400,
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.production_quantity_limits_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                "Qauntitys is = ${Cart_VM.qauntity}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.monetization_on_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "Total Price is = ${Cart_VM.total}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              // style: ButtonStyle() ,
                              onPressed: () {
                                Navigator.pushNamed(context, "/home");
                              },
                              child: Text(
                                "order Now",
                                style: TextStyle(color: Colors.orange[300]),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
