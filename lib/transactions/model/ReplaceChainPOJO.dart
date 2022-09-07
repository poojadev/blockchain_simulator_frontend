
import 'package:json_annotation/json_annotation.dart';

part 'ReplaceChainPOJO.g.dart';

@JsonSerializable()

class ReplaceChainPOJO
{

  /*

     json response
     {
	"message": "The nodes had different chains so the chain was replaced by the longest one.",
	"new_chain": [{
			"block": {
				"index": 1,
				"previous_hash": "0",
				"proof": 1,
				"timestamp": "2022-07-06 16:24:21.221966",
				"transactions": []
			},
			"hash": "20184ab4b8eaede60f8c6012f336fc2aab3de3e43f7ce741073d3162c21255ea"
		},
		{
			"block": {
				"index": 2,
				"previous_hash": "20184ab4b8eaede60f8c6012f336fc2aab3de3e43f7ce741073d3162c21255ea",
				"proof": 533,
				"timestamp": "2022-07-06 16:24:30.704296",
				"transactions": [{
					"amount": 1,
					"receiver": "PdCoin",
					"sender": "9cecf93343b14ab480274ad14fe89822"
				}]
			},
			"hash": "c205da28f5b2ac46ebf808f4b7adad074921bef496b961482ef0a49e7434eb60"
		},
		{
			"block": {
				"index": 3,
				"previous_hash": "c205da28f5b2ac46ebf808f4b7adad074921bef496b961482ef0a49e7434eb60",
				"proof": 45293,
				"timestamp": "2022-07-06 16:24:32.243314",
				"transactions": [{
					"amount": 1,
					"receiver": "PdCoin",
					"sender": "9cecf93343b14ab480274ad14fe89822"
				}]
			},
			"hash": "489cd86c14deca56664fa388e2794d1b7d364bead0c8a2a586a94b834f1ef466"
		}
	]
}
   */
 late  List<newChains> new_chain;
 late String message;

  ReplaceChainPOJO(this.new_chain,this.message);


 factory ReplaceChainPOJO.fromJson(Map<String, dynamic> json) => _$ReplaceChainPOJOFromJson(json);
 Map<String, dynamic> toJson() => _$ReplaceChainPOJOToJson(this);

//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
}
@JsonSerializable()
class newChains
{

  late blocks block;
  late String hash;
  newChains(this.block,this.hash);

  factory newChains.fromJson(Map<String, dynamic> json) => _$newChainsFromJson(json);
  Map<String, dynamic> toJson() => _$newChainsToJson(this);


}
@JsonSerializable()

class blocks
{
  late int index;
  late String previous_hash;
  late int nonce;
  late String timestamp;
  late List<allTransactions>transactions;

  blocks(this.index,this.previous_hash,this.nonce,this.timestamp);

  factory blocks.fromJson(Map<String, dynamic> json) => _$blocksFromJson(json);
  Map<String, dynamic> toJson() => _$blocksToJson(this);



}
@JsonSerializable()

class allTransactions
{
   late int amount;
   late String sender;
   late String receiver;
   allTransactions(this.amount,this.sender,this.receiver);
   factory allTransactions.fromJson(Map<String, dynamic> json) => _$allTransactionsFromJson(json);
   Map<String, dynamic> toJson() => _$allTransactionsToJson(this);



}
