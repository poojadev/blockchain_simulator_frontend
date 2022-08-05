
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../network/RestClient.dart';
import '../../../../util/appconstants/AppConstants.dart';
import '../../../mine_block/model/MineBlockPOJO.dart';
import '../../model/GetChainPOJO.dart' hide Transactions;

var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);
class BlockRepositoryImpl implements BlockRepository {

  @override
  Stream getBlocks()
  {
    print("value  getBlocks");

    return FirebaseFirestore.instance.collection(AppConstants.Block_Details).snapshots().where((value){

      print("value  00000");



      if(value.docs.isEmpty) {
        restApiClient.getChain().then((value) async {
          String documentId =
          DateTime
              .now()
              .millisecondsSinceEpoch
              .toString();
          await FirebaseFirestore.instance.collection(
              AppConstants.Block_Details)
              .doc(documentId)
              .set({
            AppConstants.Block_index: value.chain[0].block.index,
            AppConstants.Current_block_hash: value.chain[0].hash,
            AppConstants.Previous_hash: value.chain[0].block.previous_hash,
            AppConstants.Proof: value.chain[0].block.proof,
            AppConstants.Block_CreatedOn:value.chain[0].block.timestamp,
            "transactions": value.chain[0].block.transactions,
            AppConstants.Node_Number: "",

          });
        });
      }


      return value.docs!=0;

    });

  }
  @override
  Future<MineBlockPOJO>mineBlock(String mined_by)async
  {
    return  restApiClient
        .mineBlock().then((value) async{

          List<Transactions>transcationDe=[];

          for(int i=0;i<value.transactions.length;i++)
            {
              Transactions transactionDetails=Transactions(value.transactions[i].amount,
                  value.transactions[i].sender, value.transactions[i].receiver, value.transactions[i].transactionId);
               print(value.transactions[i].transactionId);
               transcationDe.add(transactionDetails);
               print(transcationDe[0].receiver);



            }
          List<Map<String,dynamic>> result = <Map<String,dynamic>>[];
          value.transactions.forEach((item) {
            result.add(item.toJson());
          });
          print(result);

        // transcationDe.addAll(value.transactions);
          // transcationDe.addAll(value.transactions);
          // print(transcationDe.toString());


      String documentId =
      DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
   await   FirebaseFirestore.instance.collection(AppConstants.Block_Details)
          .doc(documentId)
          .set({
        AppConstants.Block_index:value.index,
        AppConstants.Current_block_hash:value.hash,
        AppConstants.Previous_hash:value.previous_hash,
        AppConstants.Proof:value.proof.toInt(),
        AppConstants.Block_CreatedOn:value.timestamp,
        "transactions":result,
        AppConstants.Node_Number:mined_by,
        AppConstants.Block_Reward:100



      });
   double updateAmount=0;
   await FirebaseFirestore.instance.collection(AppConstants.Node_Deatils).where(AppConstants.Node_Number,isEqualTo: mined_by).
   get().then((value){

     for(int i=0;i<value.size;i++)
       {
        updateAmount= value.docs[i].get(AppConstants.Coins) +100;
        print("Update amount" +updateAmount.toString());


       }
     FirebaseFirestore.instance.collection(AppConstants.Node_Deatils).doc(mined_by).update({
       AppConstants.Coins:updateAmount,
       AppConstants.Block_Reward:100

     });

   });

   await FirebaseFirestore.instance.collection(AppConstants.Transactions).where(AppConstants.Transaction_Status_Flag,isEqualTo: 1).get().then((value){
     print("object" +value.docs.length.toString());
     for(int i=0;i<value.size;i++)
       {
         print("object" +value.docs[i].id.toString());

         FirebaseFirestore.instance.collection(AppConstants.Transactions).doc(value.docs[i].id).update({
           AppConstants.Transaction_Status_Flag:2,
         });
       }

   });








      return value;



    });

  }



}
abstract class BlockRepository {
  Stream getBlocks();
  Future<MineBlockPOJO>mineBlock(String mined_by);
 // Future<GetChainPOJO>getBlocks();



}
