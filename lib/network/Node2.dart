
import 'package:blockchain_world/accounts/model/CreateWalletPOJO.dart';
import 'package:blockchain_world/transactions/Model/AddTransactionPOJO.dart';
import 'package:blockchain_world/transactions/Model/ReplaceChainPOJO.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';



import '../blocks/model/GetChainPOJO.dart';
import '../mine_block/model/MineBlockPOJO.dart';
import '../nodes/Model/NodeAddressPOJO.dart';
import '../util/appconstants/AppConstants.dart';
part 'Node2.g.dart';

@RestApi(baseUrl: AppConstants.BASE_URL)
abstract class Node2 {
  factory Node2(Dio dio, {String baseUrl}) = _Node2;



  @GET(AppConstants.GET_CHAIN)
  Future<GetChainPOJO> getChain();

  @GET(AppConstants.MINE_BLOCK)
  Future<MineBlockPOJO> mineBlock();

  @POST(AppConstants.ADD_TRANSACTION)
  Future<AddTransactionPOJO> addTransaction(@Body() AddTransactionPOJO addTransactionPOJO);



  @GET(AppConstants.REPLACE_CHAIN)
  Future<ReplaceChainPOJO>replaceChain();


  @GET(AppConstants.CREATE_WALLET)
  Future<CreateWalletPOJO>createWallet();
  @POST(AppConstants.CONNECT_NODE)
  Future <String> connectNodes(@Body() NodeAddressPOJO nodeAddressPOJO);

  @GET(AppConstants.GET_CONNECTED_NODES)
  Future<NodeAddressPOJO> getConnectedNodes();



}



