import 'package:alnoormanment/shared/responsive/responsive.dart';
import 'package:alnoormanment/shared/thems.dart';
import 'package:alnoormanment/shared/widget/Calculater_widget.dart';
import 'package:alnoormanment/shared/widget/price_currency_widget.dart';
import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/material.dart';

class Calculater extends StatefulWidget {
  Calculater({Key? key}) : super(key: key);

  @override
  _CalculaterState createState() => _CalculaterState();
}

class _CalculaterState extends State<Calculater> {
  int selectindex = 2;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorPlatform.firstcolor,
              title: const Text(StringPlatform.calculator),
            ),
            
            body: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
              decoration: BoxDecoration(color: ColorPlatform.firstcolor),
              child: Row(
                children: [
                  Expanded(
                      flex: Responsive.isMobile(context) ? 0 : 6,
                      child: Container()),
                  Expanded(
                    flex: 18,
                    child: ListView(children: [
                      Calculaterwe(
                          price_buy: 0,
                          price_sale: 0,
                          price_sale_small: "",
                          price_buy_small: "",
                          title: "",
                          name_price_cal: StringPlatform.dollar,
                          name_price: StringPlatform.dollar,
                          name_price_result: StringPlatform.syrian),
                      Calculaterwe(
                          price_buy: 0,
                          price_sale: 0,
                          price_sale_small: "",
                          price_buy_small: "",
                          title: "",
                          name_price_cal: StringPlatform.turky,
                          name_price: StringPlatform.turky,
                          name_price_result: StringPlatform.syrian),
                      Calculaterwe(
                          price_buy: 0,
                          price_sale: 0,
                          price_sale_small: "",
                          price_buy_small: "",
                          title: "",
                          name_price_cal: StringPlatform.dollarandturky,
                          name_price: StringPlatform.dollar,
                          name_price_result: StringPlatform.turky)
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
