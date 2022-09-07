
import 'package:blockchain_world/accounts/model/AllAccounts/AllAccountsPOJO.dart';
import 'package:blockchain_world/accounts/model/CreateWalletPOJO.dart';
import 'package:blockchain_world/transactions/model/AddTransactionPOJO.dart';
import 'package:blockchain_world/transactions/model/ReplaceChainPOJO.dart';
import 'package:blockchain_world/transactions/model/UnConfirmedTransactionsListPOJO.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';



import '../blocks/model/GetChainPOJO.dart';
import '../mine_block/model/MineBlockPOJO.dart';
import '../nodes/Model/NodeAddressPOJO.dart';
import '../util/appconstants/AppConstants.dart';
part 'RestClient.g.dart';

@RestApi(baseUrl: AppConstants.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;



  @GET(AppConstants.GET_CHAIN)
  Future<GetChainPOJO> getChain();

  @GET(AppConstants.MINE_BLOCK)
  Future<MineBlockPOJO> mineBlock();

  @POST(AppConstants.ADD_TRANSACTION)
  Future<String> addTransaction(@Body() AddTransactionPOJO addTransactionPOJO);



  @GET(AppConstants.REPLACE_CHAIN)
  Future<ReplaceChainPOJO>replaceChain();


  @GET(AppConstants.CREATE_WALLET)
  Future<CreateWalletPOJO>createWallet(@Path() int number);

  @POST(AppConstants.CONNECT_NODE)
  Future <String> connectNodes(@Body() NodeAddressPOJO nodeAddressPOJO);

  @GET(AppConstants.GET_USER_ACCOUNTS)
  Future<AllAccountsPOJO> getAllAccounts();

  @GET(AppConstants.GET_ALL_TRANSACTIONS)
  Future<UnConfirmedTransactionsListPOJO> getAllTransactions();

  @GET(AppConstants.GET_NODE_ACCOUNTS)
  Future<AllAccountsPOJO> getNodeAccounts();

  @GET(AppConstants.CLEAR_BLOCKCHAIN)
  Future<String>  clearBlockChain();

}



