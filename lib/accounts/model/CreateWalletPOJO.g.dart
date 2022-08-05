// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateWalletPOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateWalletPOJO _$CreateWalletPOJOFromJson(Map<String, dynamic> json) =>
    CreateWalletPOJO(
      (json['amount'] as num).toDouble(),
      json['coinname'] as String,
      json['message'] as String,
      json['gaslimit'] as int,
      json['privateKey'] as String,
      json['publicKey'] as String,
    );

Map<String, dynamic> _$CreateWalletPOJOToJson(CreateWalletPOJO instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'coinname': instance.coinname,
      'gaslimit': instance.gaslimit,
      'message': instance.message,
      'privateKey': instance.privateKey,
      'publicKey': instance.publicKey,
    };
