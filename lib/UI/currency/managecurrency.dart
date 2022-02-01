import 'package:flutter/material.dart';

import '../shared/responsive/responsive.dart';
import '../shared/thems.dart';
import '../shared/widget/Add_Currency_widget.dart';
import '../shared/widget/Floating_Action_B.widget.dart';
import '../shared/words.dart';

class ManageCurrencyScreen extends StatefulWidget {
  static const String routeName = '/manage_currency';
  const ManageCurrencyScreen({Key? key}) : super(key: key);

  @override
  _ManageCurrencyScreenState createState() => _ManageCurrencyScreenState();
}

class _ManageCurrencyScreenState extends State<ManageCurrencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorPlatform.firstcolor,
              title: const Text(StringPlatform.currencymanag),
            ),
           floatingActionButton: FloatingActionBar(),
            body: Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(color: ColorPlatform.firstcolor),
              child: Row(
                children: [
                  Expanded(
                      flex: Responsive.isMobile(context) ? 0 : 6,
                      child: Container()),
                  Expanded(
                    flex: 18,
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
                    ]),
                  ),
                  Expanded(
                      flex: Responsive.isMobile(context) ? 0 : 6,
                      child: Container()),
                ],
              ),
            )));
  }
}
