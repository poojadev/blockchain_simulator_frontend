// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetChainPOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChainPOJO _$GetChainPOJOFromJson(Map<String, dynamic> json) => GetChainPOJO(
      (json['chain'] as List<dynamic>)
          .map((e) => chains.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetChainPOJOToJson(GetChainPOJO instance) =>
    <String, dynamic>{
      'chain': instance.chain,
    };

chains _$chainsFromJson(Map<String, dynamic> json) => chains(
      blocks.fromJson(json['block'] as Map<String, dynamic>),
      json['hash'] as String,
    );

Map<String, dynamic> _$chainsToJson(chains instance) => <String, dynamic>{
      'block': instance.block,
      'hash': instance.hash,
    };

blocks _$blocksFromJson(Map<String, dynamic> json) => blocks(
      json['index'] as int,
      json['previous_hash'] as String,
      json['nonce'] as int,
      json['timestamp'] as String,
      (json['transactions'] as List<dynamic>)
          .map((e) => Transactions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$blocksToJson(blocks instance) => <String, dynamic>{
      'index': instance.index,
      'previous_hash': instance.previous_hash,
      'nonce': instance.nonce,
      'timestamp': instance.timestamp,
      'transactions': instance.transactions,
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
      json['signature'] as String,
      Tx.fromJson(json['tx'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'signature': instance.signature,
      'tx': instance.tx,
    };

Tx _$TxFromJson(Map<String, dynamic> json) => Tx(
      json['amount'] as int,
      json['receiver'] as String,
      json['sender'] as String,
      json['is_mining_reward'] as int,
      json['transaction_id'] as int,
    );

Map<String, dynamic> _$TxToJson(Tx instance) => <String, dynamic>{
      'amount': instance.amount,
      'receiver': instance.receiver,
      'sender': instance.sender,
      'is_mining_reward': instance.is_mining_reward,
      'transaction_id': instance.transaction_id,
    };
