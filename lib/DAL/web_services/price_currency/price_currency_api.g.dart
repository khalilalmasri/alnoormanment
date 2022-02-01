// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_currency_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RequestPriceCurrency implements RequestPriceCurrency {
  _RequestPriceCurrency(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://alnoorexchange.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ListItemsPriceCurrency> getPrices() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListItemsPriceCurrency>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'admin/currency-price/active',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ListItemsPriceCurrency.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CountDownloadResponse> getTotalDownload() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CountDownloadResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'admin/currency-price/count-download',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CountDownloadResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ListItemsPriceCurrency> updatePriceCurrency(pricesCurrency) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(pricesCurrency.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListItemsPriceCurrency>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'admin/currency-price/update',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ListItemsPriceCurrency.fromJson(_result.data!);
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
