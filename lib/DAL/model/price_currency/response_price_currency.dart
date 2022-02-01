import 'package:alnoormanment/DAL/model/CastModelsType.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'response_price_currency.g.dart';


@JsonSerializable()
class ListItemsPriceCurrency extends Equatable {
  ListItemsPriceCurrency({
    required this.listprice,
  });

  @JsonKey(name: 'data')
  final List<ItemOfPriceCurrencyResponse> listprice;

  factory ListItemsPriceCurrency.fromJson(Map<String, dynamic> json) =>
      _$ListItemsPriceCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$ListItemsPriceCurrencyToJson(this);
  @override
  List<Object> get props => [listprice];
}

@JsonSerializable(nullable: true)
class ItemOfPriceCurrencyResponse extends Equatable {
  ItemOfPriceCurrencyResponse({
    required this.id,
    required this.currencyBuyCode,
    required this.currencyBuyName,
    required this.currencySellingCode,
    required this.currencySellingName,
    required this.currencySellingPrice,
    required this.currencyBuyPrice,
    required this.lastUpdateDate,
    required this.lastUpdateTime,
  });
  @JsonKey(name: 'id',fromJson: CastModelsType.castToInt)
  final int id;

  @JsonKey(name: 'currency_buy_code')
  final String currencyBuyCode;

  @JsonKey(name: 'currency_buy_name')
  final String currencyBuyName;

  @JsonKey(name: 'currency_selling_code')
  final String currencySellingCode;

  @JsonKey(name: 'currency_selling_name')
  final String currencySellingName;

  @JsonKey(name: 'currency_selling_price',fromJson: CastModelsType.castToDouble)
  final double currencySellingPrice;

  @JsonKey(name: 'currency_buy_price',fromJson: CastModelsType.castToDouble)
  final double currencyBuyPrice;

  @JsonKey(name: 'last_update_date')
  final String lastUpdateDate;

  @JsonKey(name: 'last_update_time')
  final String lastUpdateTime;


  @override
  List get props => [
    currencyBuyCode,
    currencyBuyName,
    currencySellingCode,
    currencySellingName,
    currencySellingPrice,
    currencyBuyPrice,
    lastUpdateDate,
    lastUpdateTime,
  ];
  factory ItemOfPriceCurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemOfPriceCurrencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemOfPriceCurrencyResponseToJson(this);

}
