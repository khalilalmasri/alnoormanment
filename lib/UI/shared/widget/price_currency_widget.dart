import 'package:alnoormanment/DAL/model/price_currency/request_price_currency.dart';
import 'package:alnoormanment/DAL/web_services/api_price_currency_constant.dart';
import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:alnoormanment/UI/shared/words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PriceCurrency extends StatefulWidget {
  final double price_buy;
  final double price_sale;
  final String title;
  final String name_price_buy;
  final String name_price_sale;
  final String name_code_sale;
  final String name_code_buy;
  final int? keyCurrencyPrice;

   PriceCurrency(
      {Key? key,
      required this.price_buy,
      required this.price_sale,
      required this.title,
      required this.name_price_buy,
      required this.name_price_sale,
      required this.name_code_sale,
      required this.name_code_buy,
      this.keyCurrencyPrice})
      : super(key: key);

  @override
  _PriceCurrencyState createState() => _PriceCurrencyState();
}

class _PriceCurrencyState extends State<PriceCurrency> {
  late TextEditingController controllerPriceBuy;
  late TextEditingController controllerPriceSale;

  @override
  void initState() {
    controllerPriceBuy = TextEditingController();
    controllerPriceSale = TextEditingController();
    controllerPriceBuy.text = widget.price_buy.toString();
    controllerPriceSale.text = widget.price_sale.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
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
                 'واحد '+ widget.name_price_sale + ' يعادل بال' + widget.name_price_buy,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                decoration: const BoxDecoration(
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: DecoPlatform.DecoFirstMainContainer,
            child: Column(
              children: [
                Container(
                  // أول أول
                  alignment: Alignment.center,
                  decoration: DecoPlatform.decosecondcontailer,
                  padding: PaddingPlatform.five,
                  height: 20,
                  width: double.infinity,
                  margin: PaddingPlatform.three,

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
                          padding: PaddingPlatform.three,
                          height: 40,
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
                          padding: PaddingPlatform.three,
                          height: 40,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: const Text(StringPlatform.sale,
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
                          padding: PaddingPlatform.three,
                          height: 40,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: TextFormField(
                            controller: controllerPriceSale,
                            style: StylePlatform.stylesaleandbuywhite,
                            onChanged: (value) {
                              value.isNotEmpty?
                              ApiPriceCurrencyConstant.listCurrencyPrice[widget.keyCurrencyPrice!].currencySellingPrice=
                                  double.parse(value):'';
                            },
                            cursorColor: ColorPlatform.thirddcolor,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.white70, fontSize: 10),
                                hintText: StringPlatform.insertvalue + '',
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
                          )),
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
                          padding: PaddingPlatform.three,
                          height: 40,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: TextFormField(
                            controller: controllerPriceBuy,
                            style: StylePlatform.stylesaleandbuywhite,
                            onChanged: (value) {
                              value.isNotEmpty?
                              ApiPriceCurrencyConstant.listCurrencyPrice[widget.keyCurrencyPrice!].currencyBuyPrice=
                                  double.parse(value):'';
                            },
                            cursorColor: ColorPlatform.thirddcolor,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.white70, fontSize: 10),
                                hintText: StringPlatform.insertvalue + '',
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
                          )),
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
