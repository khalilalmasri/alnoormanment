import 'package:alnoormanment/DAL/model/about_us/about_us.dart';
import 'package:alnoormanment/DAL/model/ads/ads.dart';
import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:alnoormanment/DAL/model/price_currency/request_price_currency.dart';
import 'package:alnoormanment/DAL/model/price_currency/response_price_currency.dart';


class ApiPriceCurrencyConstant {
  static List<ItemOfPriceCurrencyResponse> pricesCurrencyResponse =
      List<ItemOfPriceCurrencyResponse>.empty();
  static List<User>  usersResponse =[];
  static ListItemsPriceCurrency? listItemsPriceCurrency = null;
  static List<CurrencyPrice> listCurrencyPrice = [];

  static List<ItemOfAdsResponse> AdsResponse = List<ItemOfAdsResponse>.empty();

  static AboutUs? aboutUs = null;
  static int countDownload = 0;

  static AboutUsResponse? aboutUsResponse = null;
}
