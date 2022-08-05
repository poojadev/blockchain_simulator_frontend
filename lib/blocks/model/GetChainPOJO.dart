
import 'package:json_annotation/json_annotation.dart';
part 'GetChainPOJO.g.dart';


@JsonSerializable()
class GetChainPOJO
{
/*
{
    "chain": [
        {
            "block": {
                "index": 1,
                "previous_hash": "0",
                "proof": 1,
                "timestamp": "2022-07-04 13:50:48.886268",
                "transactions": []
            },
            "hash": "5fea1fc69d78d3bf606e08576310c024893fa597effb60bf37624c542960489a"
        }
    ],
    "length": 1
}

 */

  late List<chains>chain;

  GetChainPOJO(this.chain);

  factory GetChainPOJO.fromJson(Map<String, dynamic> json) => _$GetChainPOJOFromJson(json);
  Map<String, dynamic> toJson() => _$GetChainPOJOToJson(this);

}


@JsonSerializable()
class chains
{
  late blocks block;
  late String hash;
  chains(this.block,this.hash);

  factory chains.fromJson(Map<String, dynamic> json) => _$chainsFromJson(json);
  Map<String, dynamic> toJson() => _$chainsToJson(this);


}

@JsonSerializable()

class blocks
{
  late  int index;
  late   String previous_hash;
  late  int proof;
  late  String timestamp;
   late List<Transactions>transactions;
   blocks(this.index,this.previous_hash,this.proof,this.timestamp,this.transactions);

  factory blocks.fromJson(Map<String, dynamic> json) => _$blocksFromJson(json);
  Map<String, dynamic> toJson() => _$blocksToJson(this);


}



@JsonSerializable()

class Transactions
{

  late double amount;
  late String receiver;
  late String sender;
  Transactions(this.amount,this.receiver,this.sender);
  factory Transactions.fromJson(Map<String, dynamic> json) => _$TransactionsFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionsToJson(this);

}