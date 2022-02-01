import 'package:alnoormanment/DAL/model/price_currency/count_download.dart';
import 'package:alnoormanment/DAL/model/price_currency/request_price_currency.dart';
import 'package:alnoormanment/DAL/model/price_currency/response_price_currency.dart';

import 'price_currency_repository.dart';
import 'remote/api_repository.dart';

class PriceCurrencyRepositoryImpl extends PriceCurrencyRepository {
  final ApiRepository apiRepository;

  static final PriceCurrencyRepositoryImpl _singleton =
      PriceCurrencyRepositoryImpl._internal(apiRepository: ApiRepository());

  factory PriceCurrencyRepositoryImpl() {
    return _singleton;
  }

  PriceCurrencyRepositoryImpl._internal({required this.apiRepository});

  @override
  Future<ListItemsPriceCurrency> getPrices() async {
    return await apiRepository.getPrices();
  }

  @override
  Future<ListItemsPriceCurrency> updatePriceCurrency(
      ListRequestCurrencyPrice pricesCurrency) async {
    return await apiRepository.updatePriceCurrency(pricesCurrency);
  }

  @override
  Future<CountDownloadResponse> getTotalDownload() async {
    return await apiRepository.getTotalDownload();
  }
}
