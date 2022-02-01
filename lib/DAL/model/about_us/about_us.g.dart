// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutUsResponse _$AboutUsResponseFromJson(Map<String, dynamic> json) {
  return AboutUsResponse(
    aboutUs: AboutUs.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AboutUsResponseToJson(AboutUsResponse instance) =>
    <String, dynamic>{
      'data': instance.aboutUs,
    };

AboutUs _$AboutUsFromJson(Map<String, dynamic> json) {
  return AboutUs(
    id: json['id'] as int,
    key: json['key'] as String,
    value: ValueAboutUs.fromJson(json['value'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AboutUsToJson(AboutUs instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'value': instance.value,
    };

ValueAboutUs _$ValueAboutUsFromJson(Map<String, dynamic> json) {
  return ValueAboutUs(
    key: json['key'] as String,
    name: json['name'] as String,
    desc: json['desc'] as String? ?? '',
    facebook: json['facebook'] as String? ?? '',
    insta: json['insta'] as String? ?? '',
    phoneAssistant: json['phone_assistant'] as String,
    phoneManager: json['phone_manager'] as String,
    website: json['website'] as String? ?? '',
    ourMessage: json['our_message'] as String,
    ourVision: json['our_vision'] as String,
  );
}

Map<String, dynamic> _$ValueAboutUsToJson(ValueAboutUs instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'desc': instance.desc,
      'insta': instance.insta,
      'facebook': instance.facebook,
      'phone_assistant': instance.phoneAssistant,
      'phone_manager': instance.phoneManager,
      'website': instance.website,
      'our_message': instance.ourMessage,
      'our_vision': instance.ourVision,
    };
