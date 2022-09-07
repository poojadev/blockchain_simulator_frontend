




import 'package:blockchain_world/blocks/model/GetChainPOJO.dart';

class ArgumentsPOJO
{


  /*

    "index": 6,
    "message": "Congratulations, you just mined a block!",
    "previous_hash": "0e301f8b68d80ccc6c510bd9cfa610d294a5dd8772d18ee6ef329d1d0e4b3104",
    "proof": 48191,
    "timestamp": "2022-06-30 16:48:16.455910",
    "transactions": [
        {
            "amount": 12,
            "receiver": "dcoin",
            "sender": "PdCoin"
        },
        {
            "amount": 1,
            "receiver": "PdCoin",
            "sender": "5a5878e21bff42828b55fa2f46cd7db3"
        }
    ]
   */

  late  int index;
  late  String message;
  late String previous_hash;
  late int proof;
  late String  timestamp;
  late String current_block_hask;
  late List<Transactions>transactions;

  ArgumentsPOJO({required this.index,required this.message,required this. previous_hash,required this. current_block_hask,
  required this.proof,required this.timestamp,
  required this.transactions});

}