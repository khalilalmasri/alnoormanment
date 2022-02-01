import 'package:alnoormanment/BL/bloc/price_currency/bloc.dart';
import 'package:alnoormanment/DAL/model/price_currency/request_price_currency.dart';
import 'package:alnoormanment/DAL/web_services/api_price_currency_constant.dart';
import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:alnoormanment/UI/shared/widget/Button.widget.dart';
import 'package:alnoormanment/UI/shared/widget/error/error.dart';
import 'package:alnoormanment/UI/shared/widget/price_currency/count_download.dart';
import 'package:alnoormanment/UI/shared/widget/price_currency/refreshwe.dart';
import 'package:alnoormanment/UI/shared/widget/price_currency_widget.dart';
import 'package:alnoormanment/UI/shared/widget/progress/loading_indicator.dart';
import 'package:alnoormanment/UI/shared/words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyScreen extends StatefulWidget {
  static const String routeName = '/active-currency';

  CurrencyScreen({Key? key}) : super(key: key);

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  @override
  void initState() {

    context.read<PriceCurrencyBloc>().add(LoadPriceData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceCurrencyBloc, PriceCurrencyState>(
        builder: (context, state) {
      if (state is LoadPriceData) {
        return _pageContent();
      } else if (state is PriceCurrencyHasData) {
        return _pageContent();
      } else if (state is PriceCurrencyLoading) {
        return Center(child: LoadingIndicator());
      }else if (state is PriceCurrencyLoading) {
        return _pageContent();
      } else if (state is PriceCurrencyNoInternetConnection) {
        return NoInternetWidget(
          message: StringPlatform.no_internet,
          onPressed: () {
            context.read<PriceCurrencyBloc>().add(LoadPriceData());
          },
        );
      } else
        return Text('no bloc');
    });
  }

  Widget _pageContent() {
    List<Widget> listPrice = [];
    ApiPriceCurrencyConstant.listCurrencyPrice = [];
    ApiPriceCurrencyConstant.pricesCurrencyResponse
        .asMap()
        .entries
        .map((element) {
      var e = element.value;
      var index = element.key;
      ApiPriceCurrencyConstant.listCurrencyPrice.add(CurrencyPrice(
          currencyPriceId: e.id,
          currencySellingPrice: e.currencySellingPrice,
          currencyBuyPrice: e.currencyBuyPrice));

      listPrice.add(PriceCurrency(
        keyCurrencyPrice: index,
        name_code_buy: e.currencyBuyCode,
        name_code_sale: e.currencySellingCode,
        name_price_buy: e.currencyBuyName,
        name_price_sale: e.currencySellingName,
        price_sale: e.currencySellingPrice,
        price_buy: e.currencyBuyPrice,
        title: '',
      ));
    }).toList();
    // listPrice.insert(0, PhoneContactUsWidget());
    listPrice.insert(
        listPrice.length,
        ButtonWidget(
          Push_named: '',
          onPressed: () {
            context.read<PriceCurrencyBloc>().add(UpdatePriceCurrency(
                listRequestCurrencyPrice: ListRequestCurrencyPrice(
                    currencyPrices:
                        ApiPriceCurrencyConstant.listCurrencyPrice)));
          },
          Button_Name: 'تحديث الأسعار',
        ));



    listPrice.insert(
        0,
        Refreshwi(
          LastUpdateDate: ApiPriceCurrencyConstant.pricesCurrencyResponse[0].lastUpdateDate,
          LastUpdateTime: ApiPriceCurrencyConstant.pricesCurrencyResponse[0].lastUpdateTime,
        ));
    listPrice.insert(
        0,
        CountDownloadWidget(
          countDownload: ApiPriceCurrencyConstant.countDownload,
          onTap: () {
            context.read<PriceCurrencyBloc>().add(LoadCountDownloadData());
          },
        ));
    return Container(
        decoration: BoxDecoration(
          color: ColorPlatform.colorContainerBackground,
        ),
        width: double.infinity,
        padding: PaddingPlatform.ten,
        child: ListView(children: listPrice.map((e) => e).toList()));
  }
}
