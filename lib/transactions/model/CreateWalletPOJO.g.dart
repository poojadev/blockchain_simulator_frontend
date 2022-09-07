// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateWalletPOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateWalletPOJO _$CreateWalletPOJOFromJson(Map<String, dynamic> json) =>
    CreateWalletPOJO(
      json['sender'] as String?,
      json['receiver'] as String?,
      json['amount'] as int?,
      json['transactionId'] as String?,
    );

Map<String, dynamic> _$CreateWalletPOJOToJson(CreateWalletPOJO instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'receiver': instance.receiver,
      'amount': instance.amount,
      'transactionId': instance.transactionId,
    };
