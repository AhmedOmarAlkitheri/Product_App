import 'package:flutter/material.dart';
import 'package:product_app/model/product.dart';
import 'package:product_app/viewmodel/cart_vm.dart';

class DetailsScreen extends StatefulWidget {
  late Product p;
  DetailsScreen({Key? key, required this.p}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

late int item = 0;
Cart_VM c_VM = Cart_VM();
int count = 1;
String pathImage = "";

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    pathImage = widget.p.image[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ChangeNotifierProvider(
      //   create: (context) => ProAddcard(),
      //   child:

      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
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
        title: Text(
          widget.p.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Stack(clipBehavior: Clip.none, children: [
                Positioned(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 220,
                      child: Image.network(
                        pathImage,
                        fit: BoxFit.fill,
                      )),
                ),
                Positioned(
                  top: 200,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 200,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          child: ListView.builder(
                            itemCount: widget.p.image.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey[300],
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(widget.p.image[index]),
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                onTap: () {
                                  pathImage = widget.p.image[index];
                                  //   late String Position;
                                  //   String url =widget. p.image[0];
                                  //   widget.p.image[0] = widget.p.image[index];

                                  //  widget. p.image[index] = url;

                                  setState(() {});
                                },
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("brand"),
                              Text(widget.p.price.toString()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(widget.p.description),
                        SizedBox(
                          height: 15,
                        ),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       count += 1;
                        //       setState(() {
                        //         count += 1;
                        //       });
                        //       print("$count");
                        //     },
                        //     child: Icon(Icons.add)),
                        Text(
                          "  Qauntity",
                          style: TextStyle(
                            color: Colors.brown[500],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                count -= 1;
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.brown[500]),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("${count}"),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                count = count + 1;

                                setState(() {});
                                print(count);
                              },
                              child: Container(
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.brown[500]),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
      floatingActionButton:
          //   Consumer<ProAddcard>(builder: (context, proaddcard, child) {
          // return
          FloatingActionButton(
        splashColor: Colors.brown[300],
        onPressed: () {
          //   proaddcard.floatingAddCard(widget.p, count);

          c_VM.addToCard(widget.p, count);
          setState(() {});
          // Navigator.pushNamed(context, "/card", arguments: p);
        },
        child: Icon(
          Icons.add_shopping_cart,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange[400],
      ),
      //   }),
      //  ),
    );
  }
}
