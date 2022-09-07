// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnConfirmedTransactionsListPOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnConfirmedTransactionsListPOJO _$UnConfirmedTransactionsListPOJOFromJson(
        Map<String, dynamic> json) =>
    UnConfirmedTransactionsListPOJO(
      (json['transactions'] as List<dynamic>)
          .map((e) => Transactions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UnConfirmedTransactionsListPOJOToJson(
        UnConfirmedTransactionsListPOJO instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
      json['signature'] as String?,
      json['tx'] == null
          ? null
          : Tx.fromJson(json['tx'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'signature': instance.signature,
      'tx': instance.tx,
    };

Tx _$TxFromJson(Map<String, dynamic> json) => Tx(
      json['amount'] as int?,
      json['receiver'] as String?,
      json['sender'] as String?,
      json['is_mining_reward'] as int?,
      json['transaction_id'] as int?,
    );

Map<String, dynamic> _$TxToJson(Tx instance) => <String, dynamic>{
      'amount': instance.amount,
      'receiver': instance.receiver,
      'sender': instance.sender,
      'is_mining_reward': instance.is_mining_reward,
      'transaction_id': instance.transaction_id,
    };
