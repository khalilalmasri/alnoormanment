import 'package:alnoormanment/DAL/model/ads/ad_request.dart';
import 'package:alnoormanment/DAL/model/ads/ads.dart';
import 'ads_repository.dart';
import 'remote/api_repository.dart';

class AdsRepositoryImpl extends AdsRepository {
  final ApiRepository apiRepository;

  static final AdsRepositoryImpl _singleton =
      AdsRepositoryImpl._internal(apiRepository: ApiRepository());

  factory AdsRepositoryImpl() {
    return _singleton;
  }

  AdsRepositoryImpl._internal({required this.apiRepository});

  @override
  Future<ListItemsAds> getAds() async {
    return await apiRepository.getAds();
  }

  @override
  Future<AdRequest> AddAd(AdRequest adRequest) async {
    return await apiRepository.AddAd(adRequest);
  }

  @override
  Future<AdRequest> UpdateAd(AdRequest adRequest) async {
    return await apiRepository.UpdateAd(adRequest);
  }

  @override
  Future<AdRequest> DeleteAd(AdRequest adRequest) async {
    return await apiRepository.DeleteAd(adRequest);
  }

}
