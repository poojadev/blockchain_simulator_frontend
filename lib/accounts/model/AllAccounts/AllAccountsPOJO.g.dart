// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AllAccountsPOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllAccountsPOJO _$AllAccountsPOJOFromJson(Map<String, dynamic> json) =>
    AllAccountsPOJO(
      (json['accounts'] as List<dynamic>)
          .map((e) => Accounts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllAccountsPOJOToJson(AllAccountsPOJO instance) =>
    <String, dynamic>{
      'accounts': instance.accounts,
    };

Accounts _$AccountsFromJson(Map<String, dynamic> json) => Accounts(
      json['account_owner'] as String,
      json['blocks_mined'] as int,
      json['coins'] as int,
      json['is_node_account'] as bool,
      json['private_key'] as String,
      json['public_key'] as String,
      (json['updated_at'] as num).toDouble(),
    );

Map<String, dynamic> _$AccountsToJson(Accounts instance) => <String, dynamic>{
      'account_owner': instance.account_owner,
      'blocks_mined': instance.blocks_mined,
      'coins': instance.coins,
      'is_node_account': instance.is_node_account,
      'private_key': instance.private_key,
      'public_key': instance.public_key,
      'updated_at': instance.updated_at,
    };
