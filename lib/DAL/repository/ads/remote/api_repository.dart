import 'package:alnoormanment/BL/storage/local_data_shared_preference.dart';
import 'package:alnoormanment/DAL/model/ads/ad_request.dart';
import 'package:alnoormanment/DAL/model/ads/ads.dart';
import 'package:alnoormanment/DAL/repository/ads/ads_repository.dart';
import 'package:alnoormanment/DAL/web_services/ads/ads_api.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiRepository implements AdsRepository {
  Dio? _dio;
  RequestAds? __requestAds;

  ApiRepository() {
    _dio = Dio();
    _dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
    __requestAds = RequestAds(_dio!);
  }

  addAuthenticationHeader() async {
    _dio = Dio();
    _dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));

    String? token = await StorageUtil.getString('token', defValue: '');

    _dio!.options.headers = <String, dynamic>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'authorization': "Bearer " + token!,
    };
    __requestAds = RequestAds(_dio!);
  }

  @override
  Future<ListItemsAds> getAds() async {
    await this.addAuthenticationHeader();
    return __requestAds!.getAds();
  }

  @override
  Future<AdRequest> AddAd(AdRequest adRequest) async {
    await this.addAuthenticationHeader();
    return __requestAds!.AddAd(adRequest);
  }

  @override
  Future<AdRequest> UpdateAd(AdRequest adRequest) async {
    await this.addAuthenticationHeader();
    return __requestAds!.UpdatedAd(adRequest);
  }

  @override
  Future<AdRequest> DeleteAd(AdRequest adRequest) async {
    await this.addAuthenticationHeader();
    return __requestAds!.DeleteAd(adRequest);
  }


}
