// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CurrencyExchangeRatePOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyExchangeRatePOJO _$CurrencyExchangeRatePOJOFromJson(
        Map<String, dynamic> json) =>
    CurrencyExchangeRatePOJO(
      json['asset_id_base'] as String,
      (json['rates'] as List<dynamic>)
          .map((e) => ExchangeRates.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrencyExchangeRatePOJOToJson(
        CurrencyExchangeRatePOJO instance) =>
    <String, dynamic>{
      'asset_id_base': instance.asset_id_base,
      'rates': instance.rates,
    };

ExchangeRates _$ExchangeRatesFromJson(Map<String, dynamic> json) =>
    ExchangeRates(
      json['time'] as String,
      json['asset_id_quote'] as String,
      (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$ExchangeRatesToJson(ExchangeRates instance) =>
    <String, dynamic>{
      'time': instance.time,
      'asset_id_quote': instance.asset_id_quote,
      'rate': instance.rate,
    };
