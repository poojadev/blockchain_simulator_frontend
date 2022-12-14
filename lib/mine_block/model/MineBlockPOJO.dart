import 'package:json_annotation/json_annotation.dart';
part 'MineBlockPOJO.g.dart';

/*
{
    "hash": "fb5c18a5e08cf2bde6dbbbd8254aeb7584b2fb96427a6d5bcbf9c5c58dfdbaa5",
    "index": 17,
    "message": "Congratulations, you just mined a block!",
    "previous_hash": "b9dd58dc4799adf3dfef5050c6f6c28085921f42c786ad37922ab2d436a12339",
    "proof": 22592,
    "timestamp": "2022-07-24 19:00:34.478184",
    "transactions": [
        {
            "amount": 10.0,
            "receiver": "0x60324A217d4f3ba87F8C432a0fBf977820BA49dE",
            "sender": "1106a9c409f4d334ff94f2d95c111ecf147ea09ff75061a62fe2c80278a600b2",
            "transactionId": "1658597568147"
        }
    ]
}
 */
@JsonSerializable()
class MineBlockPOJO
{

  late String? hash;
  late String? previous_hash;
  late int? index;
  late String? timestamp;
  late double? nonce;
  late String? message;
  late String? node_wallet_key;

  late List<Transactions>transactions;

  MineBlockPOJO(this.hash,this.previous_hash,this.message,this.timestamp,this.node_wallet_key,this.nonce,this.index,this.transactions);
  factory MineBlockPOJO.fromJson(Map<String, dynamic> json) => _$MineBlockPOJOFromJson(json);
  Map<String, dynamic> toJson() => _$MineBlockPOJOToJson(this);

}
@JsonSerializable()
class Transactions
{
  late String signature;
  late Tx tx;
  Transactions(this.signature,this.tx);

  factory Transactions.fromJson(Map<String, dynamic> json) => _$TransactionsFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionsToJson(this);



}



@JsonSerializable()

class Tx
{

  late int amount;
  late String receiver;
  late String sender;
  late int is_mining_reward;
  late int transaction_id;
  Tx(this.amount,this.receiver,this.sender,this.is_mining_reward,this.transaction_id);
  factory Tx.fromJson(Map<String, dynamic> json) => _$TxFromJson(json);
  Map<String, dynamic> toJson() => _$TxToJson(this);

}