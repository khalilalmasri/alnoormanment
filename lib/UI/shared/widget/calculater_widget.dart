import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:alnoormanment/UI/shared/widget/Logo.widget.dart';
import 'package:alnoormanment/UI/shared/words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CalculatorWidget extends StatefulWidget {
  final double price_buy;
  final double price_sale;

  final String name_price_cal;
  final String name_price;
  final String name_price_result;

  const CalculatorWidget({
    Key? key,
    required this.price_buy,
    required this.price_sale,
    required this.name_price_cal,
    required this.name_price,
    required this.name_price_result,
  }) : super(key: key);

  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  late TextEditingController controllerQtyBuy;
  late TextEditingController controllerQtySale;
  bool main_currency = false;
  bool secondary_currency = false;

  String result_buy_calculate = "";
  String result_sale_calculate = "";
  String result_sale_calculate_secondary = "";
  String result_buy_calculate_secondary = "";
  String m = "";

  @override
  void initState() {
    controllerQtyBuy = TextEditingController();
    controllerQtySale = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,##,000');
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        clipBehavior: Clip.none,
        children: [

          Positioned(
              top: -20,
              right: 0,
              left: 0,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  StringPlatform.calculaterthe + '' + widget.name_price_cal + ' - '+widget.name_price_result,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
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
                height: 30,
              )),
          Container(
            //first container in main column

            decoration: DecoPlatform.DecoFirstMainContainer,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                  child: Row(
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
                                if (main_currency) {
                                  result_buy_calculate.isNotEmpty
                                      ? controllerQtyBuy.text =
                                      result_buy_calculate
                                      : controllerQtyBuy.text;
                                } else {
                                  result_buy_calculate_secondary.isNotEmpty
                                      ? controllerQtySale.text =
                                      double.parse(result_buy_calculate_secondary).toStringAsFixed(2)
                                          .toString()
                                      : controllerQtySale.text;
                                }
                              });
                            },
                            child: Text(StringPlatform.buy,
                                style: StylePlatform.stylesaleandbuywhite),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        //فارغ
                        child: Container(),
                      ),
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

                                if (main_currency) {
                                  result_sale_calculate.isNotEmpty
                                      ? controllerQtyBuy.text =
                                      double.parse(result_sale_calculate).toStringAsFixed(2)
                                          .toString()
                                      : controllerQtyBuy.text;
                                } else {
                                  result_sale_calculate_secondary.isNotEmpty
                                      ? controllerQtySale.text =
                                      result_sale_calculate_secondary
                                      : controllerQtySale.text;
                                }
                              });
                            },
                            child: Text(StringPlatform.sale,
                                style: StylePlatform.stylesaleandbuywhite),
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
                              child: Text(
                                  widget.price_sale>100?  formatter.format(widget.price_sale):widget.price_sale.toString(),

                                  style: StylePlatform.StyleTile))),
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 40,
                            child: TextFormField(
                              controller: controllerQtySale,
                              style: StylePlatform.stylesaleandbuywhite,
                              onChanged: (value) {

                                main_currency = true;
                                secondary_currency = false;
                                setState(() {
                                  value.isNotEmpty
                                      ? m = (double.parse(value) *
                                      widget.price_sale)
                                      .toStringAsFixed(2)
                                      .toString()
                                      : m = "";
                                  value.isNotEmpty
                                      ? result_buy_calculate =
                                      (double.parse(value) *
                                          widget.price_sale)
                                          .toStringAsFixed(2)
                                          .toString()
                                      : result_buy_calculate = "";
                                  value.isNotEmpty
                                      ? result_sale_calculate =
                                      (double.parse(value) *
                                          widget.price_buy)
                                          .toString()
                                      : result_sale_calculate = "";

                                  controllerQtyBuy.text = m;
                                });
                              },
                              cursorColor: ColorPlatform.thirddcolor,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white70, fontSize: 10),
                                  hintText: StringPlatform.insertvalue +
                                      '' +
                                      widget.name_price,
                                  focusColor: ColorPlatform.secondcolor,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: ColorPlatform.secondcolor,
                                        width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorPlatform.secondcolor,
                                          width: 2))),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              widget.price_buy>100?  formatter.format(widget.price_buy):widget.price_buy.toString(),

                              style: StylePlatform.StyleTile,
                            ),
                          )),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: DecoPlatform.decosaleandbuy,
                        padding: PaddingPlatform.three,
                        height: 35,
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            controller: controllerQtyBuy,
                            style: StylePlatform.stylesaleandbuywhite,
                            onChanged: (value) {

                              main_currency = false;
                              secondary_currency = true;
                              setState(() {
                                value.isNotEmpty
                                    ? m = (double.parse(value) /
                                    widget.price_sale)
                                    .toStringAsFixed(2)
                                    .toString()
                                    : m = "";
                                value.isNotEmpty
                                    ? result_buy_calculate_secondary =
                                    (double.parse(value) /
                                        widget.price_sale)
                                        .toStringAsFixed(2)
                                        .toString()
                                    : result_buy_calculate_secondary = "";
                                value.isNotEmpty
                                    ? result_sale_calculate_secondary =
                                    (double.parse(value) / widget.price_buy)
                                        .toStringAsFixed(2)
                                        .toString()
                                    : result_sale_calculate_secondary = "";
                                controllerQtySale.text = m;
                              });
                            },
                            cursorColor: ColorPlatform.thirddcolor,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.white70, fontSize: 10),
                                hintText: StringPlatform.insertvalue +
                                    '' +
                                    widget.name_price_result,
                                focusColor: ColorPlatform.secondcolor,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: ColorPlatform.secondcolor,
                                      width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorPlatform.secondcolor,
                                        width: 2))),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      //فارغ
                      child: Container(),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: DecoPlatform.decosaleandbuy,
                        padding: PaddingPlatform.three,
                        height: 35,
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(widget.name_price_result,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: ColorPlatform.colorwhite)),
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
