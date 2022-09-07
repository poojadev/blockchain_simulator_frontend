import 'dart:convert';
import 'package:blockchain_world/network/Node1.dart';
import 'package:blockchain_world/network/Node2.dart';
import 'package:blockchain_world/transactions/model/AddTransactionPOJO.dart';
import 'package:blockchain_world/transactions/model/UnConfirmedTransactionsListPOJO.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../network/RestClient.dart';
import '../../../../../util/appconstants/AppConstants.dart';


var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;

RestClient restApiClient = RestClient(dio);


var dio1 = Dio()..options.baseUrl = AppConstants.BASE_URL_NODE1;
Node1 node1 = Node1(dio1);


var dio2 = Dio()..options.baseUrl = AppConstants.BASE_URL_NODE2;
Node2 node2 = Node2(dio2);
class TransactionRepositoryImpl implements TransactionRepository {

  @override
  Future<AddTransactionPOJO>addTransactionToBlockNode1(addTransactionPOJO)async
  {
  return  restApiClient
        .addTransaction(addTransactionPOJO!).then((value){
          print("Transaction addd in bloack 1");
          return addTransactionPOJO;


       });

  }

  @override
  Future<AddTransactionPOJO>addTransactionToBlockNode2(addTransactionPOJO)async
  {
    return  node1
        .addTransaction(addTransactionPOJO!).then((value){
      print("Transaction addd in bloack 2");

      return addTransactionPOJO;


    });

  }

  @override
  Future<AddTransactionPOJO>addTransactionToBlockNode3(addTransactionPOJO)async
  {
    return  node2
        .addTransaction(addTransactionPOJO!).then((value){
      print("Transaction addd in bloack 3");

      return addTransactionPOJO;


    });

  }





  @override
  Future<UnConfirmedTransactionsListPOJO> getTransactionList() {
    // TODO: implement getTransactionList
    return restApiClient.getAllTransactions();
  }




}
abstract class TransactionRepository {
  Future<AddTransactionPOJO>addTransactionToBlockNode1(addTransactionPOJO);
  Future<AddTransactionPOJO>addTransactionToBlockNode2(addTransactionPOJO);
  Future<AddTransactionPOJO>addTransactionToBlockNode3(addTransactionPOJO);

  Future<UnConfirmedTransactionsListPOJO>getTransactionList();



}
