import 'dart:ui';
import 'package:alnoormanment/shared/thems.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: ColorPlatform.firstcolor),
      child: ListView(
        children: [
          Container(
            height: 250,
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            width: double.infinity,
            child: Image(image: AssetImage("images/logo.png")),
          ),
          Center(
              child: Text(
            "للحوالات والصرافة",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          Container(
            padding: EdgeInsets.all(10),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  cursorColor: Color(0xffE6B31E),
                  style: TextStyle(
                      color: Color(0xffE6B31E), fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Color(0xffE6B31E), width: 5)),
                      hintText: "new user name",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      prefixIcon: Icon(
                        Icons.group_add,
                        color: Color(0xffE6B31E),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 10))),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 010),
                  child: TextFormField(
                    obscureText: true,
                    cursorColor: Color(0xffE6B31E),
                    style: TextStyle(
                        color: Color(0xffE6B31E), fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffE6B31E), width: 5)),
                        hintText: "password",
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        prefixIcon: Icon(
                          Icons.password,
                          color: Color(0xffE6B31E),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 10))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 010),
                  child: TextFormField(
                    obscureText: true,
                    cursorColor: Color(0xffE6B31E),
                    style: TextStyle(
                        color: Color(0xffE6B31E), fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffE6B31E), width: 5)),
                        hintText: "confirm password",
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        prefixIcon: Icon(
                          Icons.password,
                          color: Color(0xffE6B31E),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 10))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 010),
                  child: TextFormField(
                    obscureText: true,
                    cursorColor: Color(0xffE6B31E),
                    style: TextStyle(
                        color: Color(0xffE6B31E), fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffE6B31E), width: 5)),
                        hintText: "mobile phone number",
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        prefixIcon: Icon(
                          Icons.phone_android_rounded,
                          color: Color(0xffE6B31E),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 10))),
                  ),
                ),
              ],
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    elevation: 15,
                    shadowColor: Color(0xffE6B31E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    primary: Color(0xffE6B31E),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("Setting");
                  },
                  child: const Text(
                    "تسجيل الدخول",
                    style: TextStyle(fontSize: 15),
                  )),
            ],
          ),
        ],
      ),
    ));
  }
}
