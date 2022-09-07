import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
part 'AllAccountsPOJO.g.dart';



/*
accounts": [
        {
            "account_owner": "127.0.0.1:5002",
            "blocks_mined": 0,
            "coins": 0,
            "is_node_account": true,
            "private_key": "e160b89ab46cde50dbbf174b11c59980afc1d3612bc49d59",
            "public_key": "c9bcc3e477f87b43807dfa897ff7942171d250c8666d6f6394bd1e41843f733109fadbe3fee7308715a6834248ee321a",
            "reward_amount": 0,
            "updated_at": 1660925923078.2258
        },
 */


@JsonSerializable()
class AllAccountsPOJO
{
  late List<Accounts>accounts;
  AllAccountsPOJO(this.accounts);
  factory AllAccountsPOJO.fromJson(Map<String, dynamic> json) => _$AllAccountsPOJOFromJson(json);
  Map<String, dynamic> toJson() => _$AllAccountsPOJOToJson(this);

}

@JsonSerializable()
class Accounts
{
  late String account_owner;
  late int blocks_mined;
  late int coins;
  late bool  is_node_account;
  late String private_key;
  late String public_key;
  late double updated_at;
  Accounts(this.account_owner,this.blocks_mined,this.coins,this.is_node_account,this.private_key,
      this.public_key,this.updated_at);
  factory Accounts.fromJson(Map<String, dynamic> json) => _$AccountsFromJson(json);
  Map<String, dynamic> toJson() => _$AccountsToJson(this);



}