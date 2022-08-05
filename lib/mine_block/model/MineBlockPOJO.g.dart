// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MineBlockPOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MineBlockPOJO _$MineBlockPOJOFromJson(Map<String, dynamic> json) =>
    MineBlockPOJO(
      json['hash'] as String,
      json['previous_hash'] as String,
      json['message'] as String,
      json['timestamp'] as String,
      (json['proof'] as num).toDouble(),
      json['index'] as int,
      (json['transactions'] as List<dynamic>)
          .map((e) => Transactions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MineBlockPOJOToJson(MineBlockPOJO instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'previous_hash': instance.previous_hash,
      'index': instance.index,
      'timestamp': instance.timestamp,
      'proof': instance.proof,
      'message': instance.message,
      'transactions': instance.transactions,
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
      (json['amount'] as num).toDouble(),
      json['receiver'] as String,
      json['sender'] as String,
      json['transactionId'] as String,
    );

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'receiver': instance.receiver,
      'sender': instance.sender,
      'transactionId': instance.transactionId,
    };
