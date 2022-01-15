import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../words.dart';
import '../thems.dart';
import '../words.dart';

class Calculaterwe extends StatefulWidget {
  final double price_buy;
  final double price_sale;
  final String price_sale_small;
  final String price_buy_small;
  final String title;
  final String name_price_cal;
  final String name_price;
  final String name_price_result;
  const Calculaterwe({
    Key? key,
    required this.price_buy,
    required this.price_sale,
    required this.price_sale_small,
    required this.price_buy_small,
    required this.title,
    required this.name_price_cal,
    required this.name_price,
    required this.name_price_result,
  }) : super(key: key);

  @override
  _CalculaterweState createState() => _CalculaterweState();
}

class _CalculaterweState extends State<Calculaterwe> {
  double syusbuy = 3500;
  double syussale = 3600;
  String uss1 = "";
  String uss2 = "";
  String m = "";
  String w = "";
  String a = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -30,
              right: 0,
              left: 0,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  StringPlatform.calculaterthe + '' + widget.name_price_cal,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          ColorPlatform.colorgrey,
                          ColorPlatform.golden
                        ]),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                height: 35,
              )),
          Container(
            //first container in main column

            decoration: DecoPlatform.DecoFirstMainContainer,
            child: Column(
              children: [
                /* Container(
                        // أول أول
                        alignment: Alignment.center,
                        decoration: DecoPlatform.decosecondcontailer,
                        padding: PaddingPlatform.five,
                        height: 25,
                        width: double.infinity,
                        margin: PaddingPlatform.three,
                        child: Text(
                          "00000",
                          style: StylePlatform.stylesecondtile,
                        ),
                      ),*/
                Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                  child: Row(
                    //بداية السطر الثاني في العمود الأول
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: DecoPlatform.decosaleandbuyButton,
                          height: 40,
                          margin: const EdgeInsets.only(top: 5),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                a = uss1;
                              });
                            },
                            child: Text(StringPlatform.buy,
                                style: StylePlatform.stylesaleandbuy),
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
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: DecoPlatform.decosaleandbuyButton,
                          height: 40,
                          margin: const EdgeInsets.only(top: 5),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                a = uss2;
                              });
                            },
                            child: Text(StringPlatform.sales,
                                style: StylePlatform.stylesaleandbuy),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                              child: Text(widget.price_buy_small,
                                  style: StylePlatform.Tilestyly))),
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 40,
                            child: TextFormField(
                              style: StylePlatform.stylesaleandbuy,
                              onChanged: (w) {
                                setState(() {
                                  w.isNotEmpty
                                      ? m = (double.parse(w) * widget.price_buy)
                                          .toString()
                                      : m = "";
                                  w.isNotEmpty
                                      ? uss1 =
                                          (double.parse(w) * widget.price_buy)
                                              .toString()
                                      : uss1 = "";
                                  w.isNotEmpty
                                      ? uss2 =
                                          (double.parse(w) * widget.price_sale)
                                              .toString()
                                      : uss2 = "";
                                  a = m;
                                });
                              },
                              cursorColor: ColorPlatform.golden,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white70, fontSize: 10),
                                  hintText: StringPlatform.insertvalue +
                                      '' +
                                      widget.name_price,
                                  /* suffixIcon: Icon(
                                    Icons.monetization_on_sharp,
                                    color: ColorPlatform.secondcolor,
                                  ),*/
                                  focusColor: ColorPlatform.ColorSix,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: ColorPlatform.golden, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorPlatform.golden,
                                          width: 2))),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              widget.price_sale_small,
                              style: StylePlatform.Tilestyly,
                            ),
                          )),
                    ],
                  ),
                ),
                Row(
                  //بداية السطر الثالث في العمود الأول
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: DecoPlatform.decosaleandbuy,
                        padding: EdgeInsets.all(3),
                        height: 40,
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          " $a",
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
                      flex: 4,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: DecoPlatform.decosaleandbuy,
                        padding: EdgeInsets.all(3),
                        height: 40,
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(widget.name_price_result,
                            style: StylePlatform.stylesaleandbuy),
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
