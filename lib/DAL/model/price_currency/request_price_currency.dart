import 'package:alnoormanment/DAL/model/CastModelsType.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_price_currency.g.dart';

@JsonSerializable()
class ListRequestCurrencyPrice extends Equatable {
  ListRequestCurrencyPrice({
    required this.currencyPrices,
  });

  @JsonKey(name: 'currencyPrices')
  final List<CurrencyPrice> currencyPrices;


  factory ListRequestCurrencyPrice.fromJson(Map<String, dynamic> json) =>
      _$ListRequestCurrencyPriceFromJson(json);

  Map<String, dynamic> toJson() => _$ListRequestCurrencyPriceToJson(this);
  @override
  List<Object> get props => [currencyPrices];
}

@JsonSerializable()
class CurrencyPrice extends Equatable {
  CurrencyPrice({
    required this.currencyPriceId,
    required this.currencySellingPrice,
    required this.currencyBuyPrice,
  });

  @JsonKey(name: 'currency_price_id' ,toJson: CastModelsType.castToInt)
   int currencyPriceId;

  @JsonKey(name: 'currency_selling_price' ,toJson: CastModelsType.castToDouble)
   double currencySellingPrice;

  @JsonKey(name: 'currency_buy_price',toJson: CastModelsType.castToDouble)
   double currencyBuyPrice;

  factory CurrencyPrice.fromJson(Map<String, dynamic> json) =>
      _$CurrencyPriceFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyPriceToJson(this);

  @override
  List<Object> get props =>[
    currencyPriceId,
    currencySellingPrice,
    currencyBuyPrice,
  ];


}
