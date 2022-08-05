// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AllAssetListPOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllAssetListPOJO _$AllAssetListPOJOFromJson(Map<String, dynamic> json) =>
    AllAssetListPOJO(
      json['id'] as String?,
      json['symbol'] as String?,
      json['name'] as String?,
      json['image'] as String,
      (json['current_price'] as num).toDouble(),
      (json['market_cap'] as num).toDouble(),
      json['market_cap_rank'] as int,
      (json['high_24h'] as num).toDouble(),
      (json['low_24h'] as num).toDouble(),
      json['last_updated'] as String,
    );

Map<String, dynamic> _$AllAssetListPOJOToJson(AllAssetListPOJO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.current_price,
      'market_cap': instance.market_cap,
      'market_cap_rank': instance.market_cap_rank,
      'high_24h': instance.high_24h,
      'low_24h': instance.low_24h,
      'last_updated': instance.last_updated,
    };
