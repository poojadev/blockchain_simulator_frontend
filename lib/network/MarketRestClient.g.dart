// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MarketRestClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _MarketRestClient implements MarketRestClient {
  _MarketRestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.coingecko.com/api/v3/coins/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<AllAssetListPOJO>> getAllAssets(currency_name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<AllAssetListPOJO>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/markets?vs_currency=$currency_name',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map(
            (dynamic i) => AllAssetListPOJO.fromJson(i as Map<String, dynamic>))
        .toList();

    print(value);
    return value;
  }

  @override
  Future<CurrencyExchangeRatePOJO> getExchangeRates(
      api_key, currency_name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'apikey': api_key};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CurrencyExchangeRatePOJO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/exchangerate/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CurrencyExchangeRatePOJO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CurrencyExchangeRatePOJO> getSpecifExchangeRates(
      api_key, currency_one, currency_two) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'apikey': api_key};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CurrencyExchangeRatePOJO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/exchangerate/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CurrencyExchangeRatePOJO.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
