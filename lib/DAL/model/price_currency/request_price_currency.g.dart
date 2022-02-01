// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_price_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListRequestCurrencyPrice _$ListRequestCurrencyPriceFromJson(
    Map<String, dynamic> json) {
  return ListRequestCurrencyPrice(
    currencyPrices: (json['currencyPrices'] as List<dynamic>)
        .map((e) => CurrencyPrice.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ListRequestCurrencyPriceToJson(
        ListRequestCurrencyPrice instance) =>
    <String, dynamic>{
      'currencyPrices': instance.currencyPrices,
    };

CurrencyPrice _$CurrencyPriceFromJson(Map<String, dynamic> json) {
  return CurrencyPrice(
    currencyPriceId: json['currency_price_id'] as int,
    currencySellingPrice: (json['currency_selling_price'] as num).toDouble(),
    currencyBuyPrice: (json['currency_buy_price'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CurrencyPriceToJson(CurrencyPrice instance) =>
    <String, dynamic>{
      'currency_price_id': CastModelsType.castToInt(instance.currencyPriceId),
      'currency_selling_price':
          CastModelsType.castToDouble(instance.currencySellingPrice),
      'currency_buy_price':
          CastModelsType.castToDouble(instance.currencyBuyPrice),
    };
