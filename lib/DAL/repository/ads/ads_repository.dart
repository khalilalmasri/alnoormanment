import 'package:alnoormanment/DAL/model/ads/ad_request.dart';
import 'package:alnoormanment/DAL/model/ads/ads.dart';

abstract class AdsRepository {
  Future<ListItemsAds> getAds();

  Future<AdRequest> UpdateAd(AdRequest adRequest);

  Future<AdRequest> AddAd(AdRequest adRequest);

  Future<AdRequest> DeleteAd(AdRequest adRequest);
}
