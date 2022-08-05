// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReplaceChainPOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplaceChainPOJO _$ReplaceChainPOJOFromJson(Map<String, dynamic> json) =>
    ReplaceChainPOJO(
      (json['new_chain'] as List<dynamic>)
          .map((e) => newChains.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String,
    );

Map<String, dynamic> _$ReplaceChainPOJOToJson(ReplaceChainPOJO instance) =>
    <String, dynamic>{
      'new_chain': instance.new_chain,
      'message': instance.message,
    };

newChains _$newChainsFromJson(Map<String, dynamic> json) => newChains(
      blocks.fromJson(json['block'] as Map<String, dynamic>),
      json['hash'] as String,
    );

Map<String, dynamic> _$newChainsToJson(newChains instance) => <String, dynamic>{
      'block': instance.block,
      'hash': instance.hash,
    };

blocks _$blocksFromJson(Map<String, dynamic> json) => blocks(
      json['index'] as int,
      json['previous_hash'] as String,
      json['proof'] as String,
      json['timestamp'] as String,
    )..transactions = (json['transactions'] as List<dynamic>)
        .map((e) => allTransactions.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$blocksToJson(blocks instance) => <String, dynamic>{
      'index': instance.index,
      'previous_hash': instance.previous_hash,
      'proof': instance.proof,
      'timestamp': instance.timestamp,
      'transactions': instance.transactions,
    };

allTransactions _$allTransactionsFromJson(Map<String, dynamic> json) =>
    allTransactions(
      json['amount'] as String,
      json['sender'] as String,
      json['receiver'] as String,
    );

Map<String, dynamic> _$allTransactionsToJson(allTransactions instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'sender': instance.sender,
      'receiver': instance.receiver,
    };
