
import 'package:blockchain_world/market_data/ListOfAllAssets/Model/AllAssetListPOJO.dart';
import 'package:blockchain_world/network/MarketRestClient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../network/RestClient.dart';
import '../../../../util/appconstants/AppConstants.dart';
import '../../../mine_block/model/MineBlockPOJO.dart';

var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
MarketRestClient restApiClient = MarketRestClient(dio);
class MarketDataRepositoryImpl implements MarketDataRepository {

  @override
  Future<List<AllAssetListPOJO>>getAllAssets(String currency_name)
  {
  return restApiClient.getAllAssets(currency_name);

  }


}
abstract class MarketDataRepository {
  Future<List<AllAssetListPOJO>>getAllAssets(String currency_name);



}
