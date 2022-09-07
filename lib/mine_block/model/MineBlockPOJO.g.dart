// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MineBlockPOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MineBlockPOJO _$MineBlockPOJOFromJson(Map<String, dynamic> json) =>
    MineBlockPOJO(
      json['hash'] as String?,
      json['previous_hash'] as String?,
      json['message'] as String?,
      json['timestamp'] as String?,
      json['node_wallet_key'] as String?,
      (json['nonce'] as num?)?.toDouble(),
      json['index'] as int?,
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
      'nonce': instance.nonce,
      'message': instance.message,
      'node_wallet_key': instance.node_wallet_key,
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
