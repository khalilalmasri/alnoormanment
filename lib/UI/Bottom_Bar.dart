import 'package:alnoormanment/UI/Calculater.dart';
import 'package:alnoormanment/UI/currency.dart';
import 'package:alnoormanment/UI/setting.dart';
import 'package:alnoormanment/shared/responsive/responsive.dart';
import 'package:alnoormanment/shared/thems.dart';
import 'package:alnoormanment/shared/widget/Button.widget.dart';
import 'package:alnoormanment/shared/widget/price_currency_widget.dart';
import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/material.dart';

class Bottom_Bar extends StatefulWidget {
  Bottom_Bar({Key? key}) : super(key: key);

  @override
  _Bottom_BarState createState() => _Bottom_BarState();
}

class _Bottom_BarState extends State<Bottom_Bar> {
  int selectindex = 0;
  List<Widget> widgetpages = [
    Currency(),
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
