import 'package:alnoormanment/main.dart';
import 'package:alnoormanment/shared/thems.dart';
import 'package:alnoormanment/shared/widget/Add_Currency_widget.dart';
import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/material.dart';

class Manag_Currency extends StatefulWidget {
  Manag_Currency({Key? key}) : super(key: key);

  @override
  _Manag_CurrencyState createState() => _Manag_CurrencyState();
}

class _Manag_CurrencyState extends State<Manag_Currency> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorPlatform.firstcolor,
              title: const Text(StringPlatform.currencymanag),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed("Addcurrency");
              },
              child: Icon(
                Icons.add,
                color: ColorPlatform.colorgrey,
              ),
              backgroundColor: ColorPlatform.golden,
            ),
            body: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: ColorPlatform.firstcolor),
                child: ListView(children: [
                  Add_Currency_Widget(
                      Currency_name_E: "USD",
                      Currency_name_A: StringPlatform.dollar),
                  Add_Currency_Widget(
                      Currency_name_E: "TRP",
                      Currency_name_A: StringPlatform.turky),
                  Add_Currency_Widget(
                      Currency_name_E: "SYP",
                      Currency_name_A: StringPlatform.syrian)
                ]))));
  }
}
