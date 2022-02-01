import 'package:alnoormanment/DAL/web_services/api_price_currency_constant.dart';
import 'package:alnoormanment/UI/shared/widget/Logo.widget.dart';
import 'package:flutter/material.dart';
import '../shared/thems.dart';
import '../shared/widget/Calculater_widget.dart';


class Calculater extends StatefulWidget {
  Calculater({Key? key}) : super(key: key);

  @override
  _CalculaterState createState() => _CalculaterState();
}

class _CalculaterState extends State<Calculater> {
  int selectindex = 2;

  @override
  Widget build(BuildContext context) {
    List<Widget> listPrice = [];

    ApiPriceCurrencyConstant.pricesCurrencyResponse.map((e) {
      listPrice.add(
          CalculatorWidget(
            price_sale: e.currencySellingPrice,
            price_buy: e.currencyBuyPrice,
            name_price: e.currencySellingName,
            name_price_result: e.currencyBuyName,
            name_price_cal: e.currencySellingName,

          ));
    }).toList();
    listPrice.insert(0,    Logo_widget());
    // listPrice.insert(
    //     listPrice.length,
    //     AdressBar()
    // );

    return Container(
      decoration: BoxDecoration(
        color: ColorPlatform.colorContainerBackground,
      ),
      width: double.infinity,
      padding: PaddingPlatform.ten,
      child: ListView(
        children: listPrice.map((e) => e).toList(),
      ),
    );
  }
}
