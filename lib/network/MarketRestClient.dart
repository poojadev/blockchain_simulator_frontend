
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../market_data/ListOfAllAssets/Model/AllAssetListPOJO.dart';
import '../market_data/ListOfAllAssets/Model/CurrencyExchangeRatePOJO.dart';
import '../util/appconstants/AppConstants.dart';
part 'MarketRestClient.g.dart';

@RestApi(baseUrl: AppConstants.Marekt_API_BASE_URL)
abstract class MarketRestClient {
  factory MarketRestClient(Dio dio, {String baseUrl}) = _MarketRestClient;




  @GET(AppConstants.GET_ASSET_DETAILS)
  Future<List<AllAssetListPOJO>> getAllAssets(String currency_name);

  @GET(AppConstants.GET_CURRENCY_EXCHANGE_RATE)
  Future<CurrencyExchangeRatePOJO> getExchangeRates(@Query("apikey") String api_key ,String currency_name);


  @GET(AppConstants.GET_CURRENCY_EXCHANGE_RATE)
  Future<CurrencyExchangeRatePOJO> getSpecifExchangeRates(@Query("apikey") String api_key ,String currency_one,String currency_two);



}



