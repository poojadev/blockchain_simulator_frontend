import 'package:json_annotation/json_annotation.dart';
part 'AddTransactionPOJO.g.dart';




/*
json structure required for this webservice
  {
  "sender":"PdCoin",
  "receiver":"krill",
  "amount":1000
}
 */

@JsonSerializable()
class AddTransactionPOJO
{

   late String? sender;
   late String? receiver;
   late double? amount;
   late String? transactionId;
   AddTransactionPOJO(this.sender,this.receiver,this.amount,this.transactionId);

   factory AddTransactionPOJO.fromJson(Map<String, dynamic> json) => _$AddTransactionPOJOFromJson(json);
   Map<String, dynamic> toJson() => _$AddTransactionPOJOToJson(this);

}