// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddTransactionPOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTransactionPOJO _$AddTransactionPOJOFromJson(Map<String, dynamic> json) =>
    AddTransactionPOJO(
      json['sender'] as String?,
      json['receiver'] as String?,
      json['amount'] as int?,
      json['sendersPrivateKey'] as String?,
    );

Map<String, dynamic> _$AddTransactionPOJOToJson(AddTransactionPOJO instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'receiver': instance.receiver,
      'amount': instance.amount,
      'sendersPrivateKey': instance.sendersPrivateKey,
    };
