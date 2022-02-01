import 'package:alnoormanment/UI/currency/Calculater.dart';
import 'package:alnoormanment/UI/currency/currency.dart';

import 'package:alnoormanment/UI/setting.dart';
import 'package:flutter/material.dart';

import 'shared/thems.dart';
import 'shared/words.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectindex = 0;
  List<Widget> widgetpages = [
    CurrencyScreen(),
    Setting(),
    Calculater(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: ColorPlatform.secondcolor,
                elevation: 5,
                selectedItemColor: ColorPlatform.colorwhite,
                currentIndex: selectindex,
                onTap: (index) {
                  setState(() {
                    selectindex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.attach_money),
                      label: StringPlatform.currency),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: StringPlatform.setting),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calculate_rounded),
                    label: StringPlatform.calculator,
                  )
                ]),
            body: widgetpages.elementAt(selectindex)));
  }
}
