import 'package:alnoormanment/DAL/model/ads/ad_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AdsEvent extends Equatable {
  const AdsEvent();

  @override
  List<Object> get props => [];
}

class LoadAdsData extends AdsEvent {}

class UpdateAd extends AdsEvent {
  final AdRequest ad;
  final BuildContext context;

  UpdateAd({required this.ad, required this.context});
}

class AddAd extends AdsEvent {
  final AdRequest newAd;
  final BuildContext context;

  AddAd({required this.newAd, required this.context});
}
class DeleteAd extends AdsEvent {
  final AdRequest existAd;
  final BuildContext context;

  DeleteAd({required this.existAd, required this.context});
}
