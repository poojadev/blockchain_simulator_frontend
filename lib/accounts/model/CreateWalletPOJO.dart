import 'package:json_annotation/json_annotation.dart';
part 'CreateWalletPOJO.g.dart';



@JsonSerializable()
class CreateWalletPOJO
{
   /*
      {
    "amount": 90,
    "coinname": "pdCoin",
    "gaslimit": 2000,
    "message": "Congratulations, you just mined a block!",
    "privateKey": "fe81f3905cf06f0efb817e33a3aa2a98f74ea7d1ccf7fec57e766000449a6110",
    "publicKey": "0xead92a919b56E0Da9cA65A55ccC8FeD4627ba573"
}
    */

    late double amount;
    late String coinname;
    late int gaslimit;
    late String message;
    late String privateKey;
    late String publicKey;
    CreateWalletPOJO(this.amount,this.coinname,this.message,this.gaslimit,this.privateKey,this.publicKey);
    factory CreateWalletPOJO.fromJson(Map<String, dynamic> json) => _$CreateWalletPOJOFromJson(json);
    Map<String, dynamic> toJson() => _$CreateWalletPOJOToJson(this);

}