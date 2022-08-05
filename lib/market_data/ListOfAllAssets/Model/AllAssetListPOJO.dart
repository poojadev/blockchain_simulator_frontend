import 'package:json_annotation/json_annotation.dart';
part 'AllAssetListPOJO.g.dart';
@JsonSerializable()
class AllAssetListPOJO
{

  /*
    "id": "bitcoin",
	"symbol": "btc",
	"name": "Bitcoin",
	"image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
	"current_price": 17671.33,
	"market_cap": 337623612077,
	"market_cap_rank": 1,
	"fully_diluted_valuation": 371116680419,
	"total_volume": 37568634392,
	"high_24h": 17782.29,
	"low_24h": 17261.09,
	"price_change_24h": 92.02,
	"price_change_percentage_24h": 0.52343,
	"market_cap_change_24h": 1561474255,
	"market_cap_change_percentage_24h": 0.46464,
	"circulating_supply": 19104762.0,
	"total_supply": 21000000.0,
	"max_supply": 21000000.0,
	"ath": 51032,
	"ath_change_percentage": -65.40473,
	"ath_date": "2021-11-10T14:24:11.849Z",
	"atl": 43.9,
	"atl_change_percentage": 40113.63061,
	"atl_date": "2013-07-05T00:00:00.000Z",
	"roi": null,
	"last_updated": "2022-07-27T10:35:16.637Z"
   */

  late String? id;
  late String? symbol;
  late String? name;
  late String image;
  late double current_price;
  late double market_cap;
  late int market_cap_rank;
  late double high_24h;
  late double low_24h;
  late String last_updated;



  AllAssetListPOJO(this.id,this.symbol,this.name,this.image,this.current_price,this.market_cap,this.market_cap_rank
      ,this.high_24h,this.low_24h,this.last_updated);
  factory AllAssetListPOJO.fromJson(Map<String, dynamic> json) => _$AllAssetListPOJOFromJson(json);
  Map<String, dynamic> toJson() => _$AllAssetListPOJOToJson(this);



}