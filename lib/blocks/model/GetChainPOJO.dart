
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
                   "transactions": [
                    {
                        "signature": "ee8c7b3512edbfb05981c5e1795b1c46386e04d7a1b95fd088bd584499a44164afe9fa73a873a86b55e2cd33f5587e8b",
                        "tx": {
                            "amount": 100,
                            "is_mining_reward": 0,
                            "receiver": "df81d0f9ffe6e3be56eac82494e05f8989736d2c3f3f93d199f7e4fb45de0d52cbd51c9fa3d46df7d354ca6eef48aa29",
                            "sender": "253c7147573bf222b055ad24c9e1cdd0d093f1e9b93bc4470b0c41309e3adb375ac508f7ed89a12ff00edc0ac81719c2",
                            "transaction_id": 300457382
                        }
                    },
                    {
                        "signature": "6c8691a30a89c3ddb2da500704eea90c03a9447c528ddaebfda725be79a95322ac54f334ccb9e3ccec0b6266ff01d91d",
                        "tx": {
                            "amount": 100,
                            "is_mining_reward": 0,
                            "receiver": "a939de82a4e40dc6bc7ab1818a7340d242221eb112053c492de48a69c4637bc182e002c89a225afb6ffed3be381047a3",
                            "sender": "253c7147573bf222b055ad24c9e1cdd0d093f1e9b93bc4470b0c41309e3adb375ac508f7ed89a12ff00edc0ac81719c2",
                            "transaction_id": 350312282
                        }
                    },
                    {
                        "signature": "1329443200849bbb024c6365c915d0029e0b98744bb84e3ef5ec35bb3b8d133bf44ab190fed878c049740691225d3163",
                        "tx": {
                            "amount": 100,
                            "is_mining_reward": 0,
                            "receiver": "f16a888d798484857722e82356a8c656d91e17aa4ab8885362b7114a01af9458b5302c4777d7dc03268d6763285eed76",
                            "sender": "253c7147573bf222b055ad24c9e1cdd0d093f1e9b93bc4470b0c41309e3adb375ac508f7ed89a12ff00edc0ac81719c2",
                            "transaction_id": 307845793
                        }
                    },
                    {
                        "signature": "8f5787854e89aa5a50b3daf583491a8701956b053f14375b73645591b4155544ffc69700ce232b15c1275442d98a7d61",
                        "tx": {
                            "amount": 100,
                            "is_mining_reward": 0,
                            "receiver": "7755e3a2946f0a6afbd7a5b9bcb4d390e80a72c0d29ab9b95ea25cf8110a4a92ae1e0eb845898805ec9311595c89ed68",
                            "sender": "253c7147573bf222b055ad24c9e1cdd0d093f1e9b93bc4470b0c41309e3adb375ac508f7ed89a12ff00edc0ac81719c2",
                            "transaction_id": 574873953
                        }
                    },
                    {
                        "signature": "c85713ea439218fccb250de0938392490b9471fdbb292e5f5a45a4ca2bcd5179f01daa3bd7a396aee700ff85fd0f1423",
                        "tx": {
                            "amount": 100,
                            "is_mining_reward": 1,
                            "receiver": "2dbb77862d2402df822be9a6dce69e46aecb07e22d893e2a0a45d92930cda0759c7a9cfd72197c97427379d8d70e5ad3",
                            "sender": "253c7147573bf222b055ad24c9e1cdd0d093f1e9b93bc4470b0c41309e3adb375ac508f7ed89a12ff00edc0ac81719c2",
                            "transaction_id": 960417017
                        }
                    }
                ]
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
  late  int nonce;
  late  String timestamp;
   late List<Transactions>transactions;
   blocks(this.index,this.previous_hash,this.nonce,this.timestamp,this.transactions);

  factory blocks.fromJson(Map<String, dynamic> json) => _$blocksFromJson(json);
  Map<String, dynamic> toJson() => _$blocksToJson(this);


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

