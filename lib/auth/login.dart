import 'dart:ui';

import 'package:alnoormanment/shared/thems.dart';
import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/material.dart';

class Logein extends StatefulWidget {
  Logein({Key? key}) : super(key: key);

  @override
  _LogeinState createState() => _LogeinState();
}

class _LogeinState extends State<Logein> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: ColorPlatform.firstcolor),
      child: ListView(
        children: [
          Container(
            height: 250,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: double.infinity,
            child: Image(image: AssetImage("images/logo.png")),
          ),
          Center(
              child: Text(
            StringPlatform.forexchange,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: ColorPlatform.colorwhite ),
          )),
          Container(
            padding: EdgeInsets.all(10),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  cursorColor: ColorPlatform.golden,
                  style: StylePlatform.formtext,
                  decoration: DecoPlatform.decofild.copyWith(
                    hintText: "user name",
                    hintStyle: StylePlatform.hinttext,
                    prefixIcon: Icon(
                      Icons.person,
                      color: ColorPlatform.golden,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    obscureText: true,
                    cursorColor: ColorPlatform.golden,
                    style: StylePlatform.formtext,
                    decoration: DecoPlatform.decofild.copyWith(
                      hintText: "password",
                      hintStyle: StylePlatform.hinttext,
                      prefixIcon: Icon(
                        Icons.password,
                        color: ColorPlatform.golden,
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 70),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  primary: ColorPlatform.golden,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("HomePage");
                },
                child: const Text(
                  StringPlatform.login,
                  style: TextStyle(fontSize: 15),
                )),
          ),
        ],
      ),
    ));
  }
}
