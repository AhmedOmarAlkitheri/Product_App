import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? groupRadio = "FeMale";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage("assets/images/22.jpeg"),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Enter Your Name ",
                          prefixIcon: Icon(
                            Icons.account_circle,
                          ),
                          label: Text("My Name is")),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),

                          // Border.all(style: BorderStyle.solid ,width: 6 ) ,
                          hintText: "Enter Your Email ",
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                          label: Text("My Email is")),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscuringCharacter: "#",
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),

                          // Border.all(style: BorderStyle.solid ,width: 6 ) ,
                          hintText: "Enter Your Password ",
                          prefixIcon: Icon(
                            Icons.password,
                          ),
                          label: Text("My Password is")),
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Male",
                            groupValue: groupRadio,
                            onChanged: (x) {
                              groupRadio = x;
                              setState(() {});
                            }),
                        Text("Male"),
                        Radio(
                            value: "FeMale",
                            groupValue: groupRadio,
                            onChanged: (x) {
                              groupRadio = x;
                              setState(() {});
                            }),
                        Text("FaMale"),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/home");
                        },
                        child: Text("Login"))
                    // DropdownButton(items: [], onChanged: (x){}),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
