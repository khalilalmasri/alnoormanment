// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdRequest _$AdRequestFromJson(Map<String, dynamic> json) {
  return AdRequest(
    name: json['name'] as String,
    image: json['image'] as String,
    link: json['link'] as String,
    isActive: json['is_active'] as bool,
    id: json['ad_id'] as int?,
  );
}

Map<String, dynamic> _$AdRequestToJson(AdRequest instance) => <String, dynamic>{
      'ad_id': CastModelsType.castToInt(instance.id),
      'name': instance.name,
      'image': instance.image,
      'link': instance.link,
      'is_active': instance.isActive,
    };
