// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListItemsAds _$ListItemsAdsFromJson(Map<String, dynamic> json) {
  return ListItemsAds(
    listAds: (json['data'] as List<dynamic>)
        .map((e) => ItemOfAdsResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ListItemsAdsToJson(ListItemsAds instance) =>
    <String, dynamic>{
      'data': instance.listAds,
    };

ItemOfAdsResponse _$ItemOfAdsResponseFromJson(Map<String, dynamic> json) {
  return ItemOfAdsResponse(
    id: json['id'] as int,
    name: json['name'] as String,
    image: ImageModel.fromJson(json['image'] as Map<String, dynamic>),
    fromDate: json['fromDate'] as String,
    toDate: json['toDate'] as String,
    isActive: CastModelsType.castFromStringToBoolean(json['is_active']),
  );
}

Map<String, dynamic> _$ItemOfAdsResponseToJson(ItemOfAdsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'fromDate': instance.fromDate,
      'is_active': instance.isActive,
      'toDate': instance.toDate,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return ImageModel(
    src: json['src'] as String,
    thumbnail: json['thumbnail'] as String,
  );
}

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'src': instance.src,
      'thumbnail': instance.thumbnail,
    };
