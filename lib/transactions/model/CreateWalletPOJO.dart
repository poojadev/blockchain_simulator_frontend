import 'package:json_annotation/json_annotation.dart';
part 'CreateWalletPOJO.g.dart';




/*
json structure required for this webservice
  {
  "sender":"PdCoin",
  "receiver":"krill",
  "amount":1000
}
 */

@JsonSerializable()
class CreateWalletPOJO
{

   late String? sender;
   late String? receiver;
   late int? amount;
   late String? transactionId;
   CreateWalletPOJO(this.sender,this.receiver,this.amount,this.transactionId);

   factory CreateWalletPOJO.fromJson(Map<String, dynamic> json) => _$CreateWalletPOJOFromJson(json);
   Map<String, dynamic> toJson() => _$CreateWalletPOJOToJson(this);

}