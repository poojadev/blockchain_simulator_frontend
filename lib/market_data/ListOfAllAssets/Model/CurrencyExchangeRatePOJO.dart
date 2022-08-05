import 'package:json_annotation/json_annotation.dart';
part 'CurrencyExchangeRatePOJO.g.dart';
@JsonSerializable()
class CurrencyExchangeRatePOJO
{
 late  String asset_id_base;
 List<ExchangeRates>rates;
 CurrencyExchangeRatePOJO(this.asset_id_base,this.rates);
 factory CurrencyExchangeRatePOJO.fromJson(Map<String, dynamic> json) => _$CurrencyExchangeRatePOJOFromJson(json);
 Map<String, dynamic> toJson() => _$CurrencyExchangeRatePOJOToJson(this);

}

@JsonSerializable()
class ExchangeRates
{

 late String time;
 late String asset_id_quote;
 late double rate;
 ExchangeRates(this.time,this.asset_id_quote,this.rate);
 factory ExchangeRates.fromJson(Map<String, dynamic> json) => _$ExchangeRatesFromJson(json);
 Map<String, dynamic> toJson() => _$ExchangeRatesToJson(this);

}
// "asset_id_base": "BTC",
// "rates" : [
// {
// "time": "2017-08-09T14:31:37.0520000Z",
// "asset_id_quote": "USD",
// "rate": 3258.8875417798037784035133948
// },