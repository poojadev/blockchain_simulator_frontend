import 'package:json_annotation/json_annotation.dart';
part 'AddTransactionPOJO.g.dart';

@JsonSerializable()
class AddTransactionPOJO
{

     /*
        {
    "sender" : "48d37f54a0ac0ffe9c639db452154b505fe58c191738a8569b950137c792bc919a58b4150a1a23df537a9224574bc11e",
    "receiver" : "af130df5620ef3f40184e7240e52170f2e79aa355a9f9678aaeb88f3ab816fd83230b16112f8837708a2c685e1757c7e",
    "amount" : 10,
    "sendersPrivateKey" : "35227ae8705297e2fe18ad685b8be64716804863fe7c34d4"
}
      */

  late String? sender;
  late String? receiver;
  late int? amount;
  //late String? message;
  late String? sendersPrivateKey;
  AddTransactionPOJO(this.sender,this.receiver,this.amount,this.sendersPrivateKey);
  factory AddTransactionPOJO.fromJson(Map<String, dynamic> json) => _$AddTransactionPOJOFromJson(json);
  Map<String, dynamic> toJson() => _$AddTransactionPOJOToJson(this);

}