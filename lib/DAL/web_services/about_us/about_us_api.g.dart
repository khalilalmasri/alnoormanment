// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RequestAboutUs implements RequestAboutUs {
  _RequestAboutUs(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://alnoorexchange.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AboutUsResponse> getAbout() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AboutUsResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'manager/company-info',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AboutUsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AboutUsResponse> updateAbout(aboutUs) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(aboutUs.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AboutUsResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'manager/company_info',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AboutUsResponse.fromJson(_result.data!);
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
