import 'package:alnoormanment/DAL/model/CastModelsType.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ads.g.dart';

@JsonSerializable()
class ListItemsAds extends Equatable {
  ListItemsAds({
    required this.listAds,
  });

  @JsonKey(name: 'data')
  final List<ItemOfAdsResponse> listAds;

  factory ListItemsAds.fromJson(Map<String, dynamic> json) =>
      _$ListItemsAdsFromJson(json);

  @override
  List<Object> get props => [listAds];
}

@JsonSerializable()
class ItemOfAdsResponse extends Equatable {
  ItemOfAdsResponse({
    required this.id,
    required this.name,
    required this.image,
    required this.fromDate,
    required this.toDate,
    required this.isActive,
  });

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'image')
  final ImageModel image;

  @JsonKey(name: 'fromDate')
  final String fromDate;

  // final DateTime fromDate;

  @JsonKey(name: 'is_active',fromJson: CastModelsType.castFromStringToBoolean)
  final bool isActive;

  @JsonKey(name: 'toDate')
  final String toDate;

  factory ItemOfAdsResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemOfAdsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemOfAdsResponseToJson(this);

  @override
  List<Object> get props => [id, name, image, fromDate, toDate];
}

@JsonSerializable()
class ImageModel extends Equatable {
  ImageModel({
    required this.src,
    required this.thumbnail,
  });

  @JsonKey(name: 'src')
  final String src;

  @JsonKey(name: 'thumbnail')
  final String thumbnail;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  @override
  List<Object> get props => [src, thumbnail];
}
