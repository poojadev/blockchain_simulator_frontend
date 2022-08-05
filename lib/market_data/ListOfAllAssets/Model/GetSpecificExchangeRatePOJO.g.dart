// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetSpecificExchangeRatePOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSpecificExchangeRatePOJO _$GetSpecificExchangeRatePOJOFromJson(
        Map<String, dynamic> json) =>
    GetSpecificExchangeRatePOJO(
      json['time'] as String?,
      json['asset_id_base'] as String?,
      json['asset_id_quote'] as String?,
      (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetSpecificExchangeRatePOJOToJson(
        GetSpecificExchangeRatePOJO instance) =>
    <String, dynamic>{
      'time': instance.time,
      'asset_id_base': instance.asset_id_base,
      'asset_id_quote': instance.asset_id_quote,
      'rate': instance.rate,
    };
