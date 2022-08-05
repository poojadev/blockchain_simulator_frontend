

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../network/RestClient.dart';
import '../../../../util/appconstants/AppConstants.dart';
import '../../../model/CreateWalletPOJO.dart';


var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);
class AccountRepositoryImpl implements AccountRepository {

  @override
  Future<void>insertNodes(int nodeLength)async
  {


    var random = Random();


    for(int i=0;i<nodeLength;i++)
    {   

    createWallet().then((value) async{
        String documentId =
        DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        FirebaseFirestore.instance.collection(AppConstants.Node_Deatils)
            .doc(documentId)
            .set({
          AppConstants.Private_Key:value.privateKey,
          AppConstants.Public_key:value.publicKey,
          AppConstants.Coins:value.amount,
          AppConstants.Gas_limit:value.gaslimit,
          AppConstants.Wallet_CretedOn: DateTime
              .now(),
          AppConstants.Transaction_Status_Flag:0,

          AppConstants.Node_Number:documentId,
          AppConstants.Block_Reward:0



        });








  });
          }
      }

  @override
  Future<CreateWalletPOJO>createWallet()async
  {
    return  restApiClient
        .createWallet();

  }

  @override
  Future<void>updateWalletAmount(String id,double amount)async
  {

    await FirebaseFirestore.instance.collection(AppConstants.Node_Deatils).doc(id).update({
      AppConstants.Coins:amount

    });


  }

  @override
  Stream getNodes()
  {
    return  FirebaseFirestore.instance.collection(AppConstants.Node_Deatils).snapshots();

  }
  @override

  Future<int>getNodeMinedBlockCount(String nodeId)
  {
    print("nodeId" +nodeId);
     return FirebaseFirestore.instance.collection(AppConstants.Block_Details).
     where(AppConstants.Node_Number,isEqualTo: nodeId).get().then((value){
       return value.size;

     });
  }

  @override

  Future<void>getNodeMinedBlockDetails(String nodeId)
  {
    print("nodeId" +nodeId);
    return FirebaseFirestore.instance.collection(AppConstants.Block_Details).
    where(AppConstants.Node_Number,isEqualTo: nodeId).get();
  }


}
abstract class AccountRepository {
  Future<void>insertNodes(int nodeLength);
  Stream getNodes();
  Future<CreateWalletPOJO>createWallet();
  Future<void>updateWalletAmount(String id,double amount);
  Future<int>getNodeMinedBlockCount(String nodeId);
  Future<void>getNodeMinedBlockDetails(String nodeId);



}
