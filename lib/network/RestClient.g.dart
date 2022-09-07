// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RestClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://178.62.253.125/node_one';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GetChainPOJO> getChain() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetChainPOJO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/get_chain',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetChainPOJO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MineBlockPOJO> mineBlock() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MineBlockPOJO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/mine_block',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MineBlockPOJO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> addTransaction(addTransactionPOJO) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addTransactionPOJO.toJson());
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/add_transaction',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    print("LT" +value.length.toString());

    return value;
  }

  @override
  Future<ReplaceChainPOJO> replaceChain() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ReplaceChainPOJO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/replace_chain',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ReplaceChainPOJO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreateWalletPOJO> createWallet(number) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateWalletPOJO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/create_wallet/${number}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateWalletPOJO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> connectNodes(nodeAddressPOJO) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = nodeAddressPOJO;
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/connect_node',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<AllAccountsPOJO> getAllAccounts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AllAccountsPOJO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/get_user_accounts',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AllAccountsPOJO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UnConfirmedTransactionsListPOJO> getAllTransactions() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UnConfirmedTransactionsListPOJO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/get_transactions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    print("UnConfirmedTransactionsListPOJO" +_dio.options.baseUrl);
    print("UnConfirmedTransactionsListPOJO" +_dio.options.queryParameters.toString());
    print("UnConfirmedTransactionsListPOJO" +_dio.options.queryParameters.values.toString());
    print("UnConfirmedTransactionsListPOJO" +_result.data!.values.toString());
    print("UnConfirmedTransactionsListPOJO" +_result.realUri.toString());




    final value = UnConfirmedTransactionsListPOJO.fromJson(_result.data!);
    print("LG" +value.transactions.length.toString());
    return value;
  }

  @override
  Future<AllAccountsPOJO> getNodeAccounts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AllAccountsPOJO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/get_node_accounts',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AllAccountsPOJO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> clearBlockChain() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/clear_blockchain',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
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
