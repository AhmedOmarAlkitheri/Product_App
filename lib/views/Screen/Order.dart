import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<Map<String, String>> Drobdown = [
    {"Even": "Evening"},
    {"Morn": "Morning"},
  ];
  bool isCorrect = false;
  String connection_time = "";
  String paymentmethod = "";

  String? i;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? Payment_Method;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Text(
          "Order",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (x) => nameRecipient(x!),
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                isCorrect == false ? Colors.red : Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(
                          //       color:
                          //           isCorrect == false ? Colors.red : Colors.green,
                          //     ),
                          borderRadius: BorderRadius.circular(20)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),

                      // Border.all(style: BorderStyle.solid ,width: 6 ) ,
                      hintText: "Enter Your Recipient Name ",
                      prefixIcon: Icon(
                        Icons.account_circle_sharp,
                      ),
                      label: Text(
                        "Recipient Name",
                        style: TextStyle(
                          color: isCorrect == false ? Colors.red : Colors.green,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phone,
                  validator: (x) => Phone(x!),
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  //    autovalidate: true,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                isCorrect == false ? Colors.red : Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(
                          //       color:
                          //           isCorrect == false ? Colors.red : Colors.green,
                          //     ),
                          borderRadius: BorderRadius.circular(20)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      //              Border.all(style: BorderStyle.solid ,width: 6 ) ,
                      hintText: "Enter Your Phone ",
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                      label: Text(
                        "Phone",
                        style: TextStyle(
                          color: isCorrect == false ? Colors.red : Colors.green,
                        ),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: DropdownButton(
                      hint: Text("Choose the connection time"),
                      value: i,
                      items: Drobdown.map((e) {
                        // i = e.keys.toString();
                        return DropdownMenuItem(
                          value: e.keys.first,
                          child: Text("${e.values.first}"),
                        );
                      }).toList(),
                      onChanged: (val) {
                        i = val;
                        setState(() {});
                      }),
                ),
                Center(
                    child: Text(
                  "$connection_time",
                  style: TextStyle(color: Colors.red),
                )),
                SizedBox(
                  height: 10,
                ),
                Text("Payment Method"),
                Row(
                  children: [
                    Radio(
                        value: "receipt",
                        groupValue: Payment_Method,
                        onChanged: (val) {
                          Payment_Method = val;
                          setState(() {});
                        }),
                    Text("Receipt")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: "AL Amaqy",
                        groupValue: Payment_Method,
                        onChanged: (val) {
                          Payment_Method = val;
                          setState(() {});
                        }),
                    Text("AL Amaqy"),
                  ],
                ),
                Row(children: [
                  Radio(
                      value: "AL Karimi",
                      groupValue: Payment_Method,
                      onChanged: (val) {
                        Payment_Method = val;
                        setState(() {});
                      }),
                  Text("AL Karimi"),
                ]),
                Center(
                    child: Text(
                  "$paymentmethod",
                  style: TextStyle(color: Colors.red),
                )),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),

                      // Border.all(style: BorderStyle.solid ,width: 6 ) ,
                      hintText: "Notes",
                      prefixIcon: Icon(
                        Icons.note,
                      ),
                      label: Text("Notes Here")),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStateColor.transparent),
                      onPressed: () {
                        if (formkey.currentState!.validate() == true &&
                            i != null) {
                          Navigator.pushNamed(context, "/home");
                        } else if (i == null) {
                          connection_time = "يجب تحديد وقت التوصيل";
                        } else if (Payment_Method == null) {
                          paymentmethod = "يجب تحديد طريقة واحدة للدفع";
                        }
                        setState(() {});
                        // formkey.currentState!.validate();
                      },
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.orange[300]),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  nameRecipient(String value) {
    List<String> val = value.split(" ");
    print(val);
    if (value != null && value.isNotEmpty && val.length >= 3) {
      setState(() {
        isCorrect = true;
      });
      return null;
    } else {
      setState(() {
        isCorrect = false;
      });
      return "ادخل اسم المستلم الثلاثي اقل شي بشكل صحيح";
    }
  }

  Phone(String value) {
    String val = "";

    val = value.substring(0, 2);
    List<String> number = ["77", "73", "71", "70", "78"];
    String num = "";
    number.forEach((element) {
      if (element == val) num = element;
    });
    if (value != null && value.isNotEmpty && value.length == 9 && val == num) {
      setState(() {
        isCorrect = true;
      });
      return null;
    } else {
      setState(() {
        isCorrect = false;
      });
      return "ادخل رقم الهاتف بشكل صحيح و يكون رقم يمني";
    }
  }
}
