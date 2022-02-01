import 'package:alnoormanment/DAL/model/price_currency/count_download.dart';
import 'package:alnoormanment/DAL/model/price_currency/request_price_currency.dart';
import 'package:alnoormanment/DAL/model/price_currency/response_price_currency.dart';

abstract class PriceCurrencyRepository {
  Future<ListItemsPriceCurrency> getPrices();

  Future<CountDownloadResponse> getTotalDownload();

  Future<ListItemsPriceCurrency> updatePriceCurrency(
      ListRequestCurrencyPrice pricesCurrency);
}
