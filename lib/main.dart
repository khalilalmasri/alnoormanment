import 'package:alnoormanment/UI/Addcurrency.dart';
import 'package:alnoormanment/UI/we.dart';
import 'package:alnoormanment/auth/login.dart';
import 'package:alnoormanment/auth/signup.dart';
import 'package:alnoormanment/UI/Calculater.dart';
import 'package:alnoormanment/UI/adduser.dart';
import 'package:alnoormanment/UI/setting.dart';
import 'package:flutter/material.dart';
import 'UI/Adv_Add.dart';
import 'UI/Advertizmanager.dart';
import 'UI/currency.dart';
import 'UI/managecurrency.dart';
import 'UI/setting.dart';
import 'UI/Bottom_Bar.dart';
import 'UI/usersmanager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Logein(),
        theme: ThemeData(fontFamily: "NotoKufiArabic"),
        routes: {
          "login": (context) => Logein(),
          "signup": (context) => signup(),
          "Setting": (context) => Setting(),
          "Currency": (context) => Currency(),
          "BottomBar": (context)=> Bottom_Bar(),
          "Usersmanager": (context) => Usersmanager(),
          "AddUser": (context) => AddUser(),
          "Calculator": (context) => Calculater(),
          "We": (context) => We(),
          "ManagCurrency": (context) => Manag_Currency(),
          "Addcurrency":(context)=> Add_Currency(),
          "Advmanager":(context)=> Advsmanager(),
          "AddAdv":(context)=> Add_Adv(),
        });
  }
}

var currency;
