

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../network/RestClient.dart';
import '../../../../../util/appconstants/AppConstants.dart';
import '../../Model/AddTransactionPOJO.dart';
import 'package:crypto/crypto.dart';


var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);
AddTransactionPOJO? addTransactionPOJO;

class TransactionRepositoryImpl implements TransactionRepository {

  @override
  Future<AddTransactionPOJO>addTransactionToBlock(addTransactionPOJO)async
  {
  return  restApiClient
        .addTransaction(addTransactionPOJO!).then((value){
          return addTransactionPOJO;


       });

  }


  @override
  Future<void>addTransactionToFirebase(String senderId,String receiverId,double amount,String node_id)
  async {



    // var bytes1 = utf8.encode(senderId+receiverId);         // data being hashed
    // var digest1 = sha256.convert(bytes1);
    String documentId =
        DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
    var output = sha256.convert(utf8.encode(senderId+receiverId+documentId)).toString();

    await  FirebaseFirestore.instance.collection(AppConstants.Transactions)
        .doc(documentId)
        .set({
      AppConstants.Transaction_Amount:amount,
      AppConstants.Transaction_From:senderId,
      AppConstants.Transaction_To:receiverId,
      AppConstants.Transaction_Status_Flag:1,
      AppConstants.Transaction_DateTime: DateTime
          .now(),
    AppConstants.Node_Number:node_id,
    AppConstants.Transaction_Hash:output,
      AppConstants.Block_Reward:0



    });
           print("Transaction nserting...");

  }
  @override
  Stream getTransactions(int transactionStatusFlag) {

    return FirebaseFirestore.instance.collection(AppConstants.Transactions).where(AppConstants.Transaction_Status_Flag,isEqualTo: transactionStatusFlag).snapshots();
  }
  @override
  Stream getNodeTransactions( String nodePublicKey) {

    return FirebaseFirestore.instance.collection(AppConstants.Transactions).where(AppConstants.Transaction_From,isEqualTo: nodePublicKey).snapshots();
  }




}
abstract class TransactionRepository {
  Future<AddTransactionPOJO>addTransactionToBlock(addTransactionPOJO);
  Future<void>addTransactionToFirebase(String senderId,String receiverId,double amount,String node_number);
  Stream getTransactions(int transactionStatusFlag);
  Stream getNodeTransactions(String nodePublicKey);



}
