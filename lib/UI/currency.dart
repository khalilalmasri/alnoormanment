import 'package:alnoormanment/shared/responsive/responsive.dart';
import 'package:alnoormanment/shared/thems.dart';
import 'package:alnoormanment/shared/widget/Button.widget.dart';
import 'package:alnoormanment/shared/widget/price_currency_widget.dart';
import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/material.dart';

class Currency extends StatefulWidget {
  Currency({Key? key}) : super(key: key);

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
 
  
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorPlatform.firstcolor,
              title: const Text(StringPlatform.currencymanag),
            ),
            body: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              decoration: BoxDecoration(color: ColorPlatform.firstcolor),
              child: Row(
                children: [
                  Expanded(
                      flex: Responsive.isMobile(context) ? 0 : 6,
                      child: Container()),
                  Expanded(
                    flex: 18,
                    child: ListView(children: [
                      PriceCurrency(
                          price_buy: 5,
                          price_sale: 5,
                          title: "",
                          name_price_buy: StringPlatform.dollar,
                          name_price_sale: StringPlatform.syrian,
                          name_code_sale: "",
                          name_code_buy: ""),
                      PriceCurrency(
                          price_buy: 0,
                          price_sale: 0,
                          title: "",
                          name_price_buy: StringPlatform.turky,
                          name_price_sale: StringPlatform.syrian,
                          name_code_sale: "",
                          name_code_buy: ""),
                      PriceCurrency(
                          price_buy: 0,
                          price_sale: 0,
                          title: "",
                          name_price_buy: StringPlatform.dollar,
                          name_price_sale: StringPlatform.turky,
                          name_code_sale: "",
                          name_code_buy: ""),
                      Button_widget(
                          Button_Name: StringPlatform.manag,
                          Push_named: "ManagCurrency")
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
