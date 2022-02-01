// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_price_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListItemsPriceCurrency _$ListItemsPriceCurrencyFromJson(
    Map<String, dynamic> json) {
  return ListItemsPriceCurrency(
    listprice: (json['data'] as List<dynamic>)
        .map((e) =>
            ItemOfPriceCurrencyResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ListItemsPriceCurrencyToJson(
        ListItemsPriceCurrency instance) =>
    <String, dynamic>{
      'data': instance.listprice,
    };

ItemOfPriceCurrencyResponse _$ItemOfPriceCurrencyResponseFromJson(
    Map<String, dynamic> json) {
  return ItemOfPriceCurrencyResponse(
    id: CastModelsType.castToInt(json['id']),
    currencyBuyCode: json['currency_buy_code'] as String,
    currencyBuyName: json['currency_buy_name'] as String,
    currencySellingCode: json['currency_selling_code'] as String,
    currencySellingName: json['currency_selling_name'] as String,
    currencySellingPrice:
        CastModelsType.castToDouble(json['currency_selling_price']),
    currencyBuyPrice: CastModelsType.castToDouble(json['currency_buy_price']),
    lastUpdateDate: json['last_update_date'] as String,
    lastUpdateTime: json['last_update_time'] as String,
  );
}

Map<String, dynamic> _$ItemOfPriceCurrencyResponseToJson(
        ItemOfPriceCurrencyResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency_buy_code': instance.currencyBuyCode,
      'currency_buy_name': instance.currencyBuyName,
      'currency_selling_code': instance.currencySellingCode,
      'currency_selling_name': instance.currencySellingName,
      'currency_selling_price': instance.currencySellingPrice,
      'currency_buy_price': instance.currencyBuyPrice,
      'last_update_date': instance.lastUpdateDate,
      'last_update_time': instance.lastUpdateTime,
    };
