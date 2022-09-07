
import 'package:blockchain_world/network/Node2.dart';
import 'package:blockchain_world/transactions/model/ReplaceChainPOJO.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../network/RestClient.dart';
import '../../../../util/appconstants/AppConstants.dart';
import '../../../mine_block/model/MineBlockPOJO.dart';
import '../../../network/Node1.dart';
import '../../model/GetChainPOJO.dart' hide Transactions;

var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);


var dio1 = Dio()..options.baseUrl = AppConstants.BASE_URL;
Node1 node1 = Node1(dio1);


var dio2 = Dio()..options.baseUrl = AppConstants.BASE_URL;
Node2 node2 = Node2(dio2);
class BlockRepositoryImpl implements BlockRepository {
  late String  receiver;

  @override
  Future<MineBlockPOJO>mineBlockNodeTwo()async
  {
    return  node1
        .mineBlock();

  }


  @override
  Future<GetChainPOJO> getNodeTwoBlockChain() {
    return node1.getChain();
  }


  @override
  Future<GetChainPOJO> getNodeThreeBlockChain() {
    return node2.getChain();
  }


  @override
  Future<GetChainPOJO> getNodeOneBlockChain() {
    print("inside getNodeOneBlockChain");

    return restApiClient.getChain().then((value) {
      print("object" +value.chain.toString());
      return value;
    });

  }


  @override
  Future<MineBlockPOJO> mineBlockNodeOne() {
    return  restApiClient
        .mineBlock();
  }

  @override
  Future<MineBlockPOJO>mineBlockNodeThree()async
  {
    return  node2
        .mineBlock();

  }




}
abstract class BlockRepository {
  Future<MineBlockPOJO>mineBlockNodeTwo();
  Future<MineBlockPOJO>mineBlockNodeOne();
  Future<MineBlockPOJO>mineBlockNodeThree();


  Future<GetChainPOJO>getNodeTwoBlockChain();
  Future<GetChainPOJO>getNodeOneBlockChain();




}
