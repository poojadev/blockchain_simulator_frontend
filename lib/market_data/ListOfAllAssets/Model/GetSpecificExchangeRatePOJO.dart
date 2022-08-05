
//
// "time": "2022-07-19T00:33:01.0000000Z",
// "asset_id_base": "BTC",
// "asset_id_quote": "USD",
// "rate": 22563.232058918855410669888132
import 'package:json_annotation/json_annotation.dart';
part 'GetSpecificExchangeRatePOJO.g.dart';
@JsonSerializable()
class GetSpecificExchangeRatePOJO
{
    late  String? time;
    late String? asset_id_base;
    late String? asset_id_quote;
    late  double? rate;

    GetSpecificExchangeRatePOJO(this.time,this.asset_id_base,this.asset_id_quote,this.rate);
    factory GetSpecificExchangeRatePOJO.fromJson(Map<String, dynamic> json) => _$GetSpecificExchangeRatePOJOFromJson(json);
    Map<String, dynamic> toJson() => _$GetSpecificExchangeRatePOJOToJson(this);

}