

import 'dart:math';

import 'package:blockchain_world/accounts/model/AllAccounts/AllAccountsPOJO.dart';
import 'package:blockchain_world/transactions/model/AddTransactionPOJO.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../network/RestClient.dart';
import '../../../../util/appconstants/AppConstants.dart';
import '../../../model/CreateWalletPOJO.dart';


var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);
AllAccountsPOJO? accountsPOJO;
class AccountRepositoryImpl implements AccountRepository {


  @override
  Future<CreateWalletPOJO>createWallet(int number)async
  {
    return  restApiClient
        .createWallet(number);

  }

  @override
  Future<void>updateWalletAmount(String id,int amount)async
  {

    await FirebaseFirestore.instance.collection(AppConstants.Account_Details).doc(id).update({
      AppConstants.Coins:amount

    });


  }


  @override
  Future getAllAccounts() async{
    // TODO: implement getAllAccounts
    return await restApiClient.getAllAccounts().then((value) {
      print("restApiClient" +value.accounts.toString());

      accountsPOJO=value;
    });
  }


}
abstract class AccountRepository {

  Future<CreateWalletPOJO>createWallet(int number);

  Future getAllAccounts();


}
