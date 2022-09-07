import 'package:json_annotation/json_annotation.dart';
part 'UnConfirmedTransactionsListPOJO.g.dart';


@JsonSerializable()

class UnConfirmedTransactionsListPOJO
{
     /*
        {
    "message": "All transactions",
    "transactions": [
        {
            "signature": "cdd1cf086dc5e6a37d5d852ec54a9058389dd82e545303cdee3beffcd1966cdd13baf9f7bc0a87a96c30d0931a5de599",
            "tx": {
                "amount": 9,
                "is_mining_reward": 0,
                "receiver": "d360f29a16e438176131a215d522082d72199f273934de567a981c0c15390aca08ad511b73a7ff286e8b374cd04d67f8",
                "sender": "f5f409372f5b471ab0f6434a1b2584dd75e7b351afd89d2805956e7bac7289a1953ff8afccde8e2857306f2b8a513cf9",
                "transaction_id": 54951372
            }
        },
        {
            "signature": "37f5cfd988027e8ea3e156fa89a9633ef6a844b010291855e9a49f476dc0eb0a82b7e5d2a929ca5d135b123ffe360fd2",
            "tx": {
                "amount": 8,
                "is_mining_reward": 0,
                "receiver": "d360f29a16e438176131a215d522082d72199f273934de567a981c0c15390aca08ad511b73a7ff286e8b374cd04d67f8",
                "sender": "f5f409372f5b471ab0f6434a1b2584dd75e7b351afd89d2805956e7bac7289a1953ff8afccde8e2857306f2b8a513cf9",
                "transaction_id": 374494976
            }
        },
    ]
}
      */
  List<Transactions>transactions;
  UnConfirmedTransactionsListPOJO(this.transactions);

  factory UnConfirmedTransactionsListPOJO.fromJson(Map<String, dynamic> json) => _$UnConfirmedTransactionsListPOJOFromJson(json);
  Map<String, dynamic> toJson() => _$UnConfirmedTransactionsListPOJOToJson(this);



}



@JsonSerializable()
class Transactions
{
  late String? signature;
  late Tx? tx;
  Transactions(this.signature,this.tx);

  factory Transactions.fromJson(Map<String, dynamic> json) => _$TransactionsFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionsToJson(this);



}



@JsonSerializable()

class Tx
{

  late int? amount;
  late String? receiver;
  late String? sender;
  late int? is_mining_reward;
  late int? transaction_id;
  Tx(this.amount,this.receiver,this.sender,this.is_mining_reward,this.transaction_id);
  factory Tx.fromJson(Map<String, dynamic> json) => _$TxFromJson(json);
  Map<String, dynamic> toJson() => _$TxToJson(this);

}

