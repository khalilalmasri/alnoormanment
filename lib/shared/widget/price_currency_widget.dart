import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../thems.dart';

class PriceCurrency extends StatefulWidget {
  final double price_buy;
  final double price_sale;
  final String title;
  final String name_price_buy;
  final String name_price_sale;
  final String name_code_sale;
  final String name_code_buy;
  const PriceCurrency(
      {Key? key,
      required this.price_buy,
      required this.price_sale,
      required this.title,
      required this.name_price_buy,
      required this.name_price_sale,
      required this.name_code_sale,
      required this.name_code_buy})
      : super(key: key);
  @override
  _PriceCurrencyState createState() => _PriceCurrencyState();
}

class _PriceCurrencyState extends State<PriceCurrency> {
  @override
  Widget build(BuildContext context) {
    var decosecondcontailer;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -10,
              right: 0,
              left: 0,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  widget.name_price_buy + '-' + widget.name_price_sale,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          ColorPlatform.thirddcolor,
                          ColorPlatform.secondcolor
                        ]),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                height: 35,
              )),
          Container(
            //first container in main column
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: DecoPlatform.DecoFirstMainContainer,
            child: Column(
              children: [
                Container(
                  // أول أول
                  alignment: Alignment.center,

                  padding: EdgeInsets.all(5),
                  height: 25,
                  width: double.infinity,
                  margin: EdgeInsets.all(3),
                  child: Text(
                    widget.name_code_sale + ' - ' + widget.name_code_buy,
                    style: StylePlatform.subtitle,
                  ),
                ),
                Container(
                  child: Row(
                    //بداية السطر الثاني في العمود الأول
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: DecoPlatform.decosaleandbuy,
                          padding: EdgeInsets.all(3),
                          height: 50,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: const Text(StringPlatform.buy,
                              style: StylePlatform.stylesaleandbuy),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        //فارغ
                        child: Container(),
                      ),
                      Expanded(
                        // نهاية السطر الثاني في العمود الأول
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: DecoPlatform.decosaleandbuy,
                          padding: EdgeInsets.all(3),
                          height: 50,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: const Text(StringPlatform.sales,
                              style: StylePlatform.stylesaleandbuy),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  //بداية السطر الثالث في العمود الأول
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: DecoPlatform.decosaleandbuy,
                        padding: EdgeInsets.all(3),
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        child: TextFormField(
                          style: StylePlatform.stylesaleandbuy,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      //فارغ
                      child: Container(),
                    ),
                    Expanded(
                      // نهاية السطر الثاني في العمود الأول
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: DecoPlatform.decosaleandbuy,
                        padding: EdgeInsets.all(3),
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        child:
                            TextFormField(style: StylePlatform.stylesaleandbuy),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PriceCurrencyStyle {
  static const TextStyle saleStyle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: ColorPlatform.golden);
}
