import 'package:alnoormanment/DAL/model/CastModelsType.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'about_us.g.dart';

@JsonSerializable()
class AboutUsResponse extends Equatable {
  AboutUsResponse({
    required this.aboutUs,
  });

  @JsonKey(name: 'data')
  final AboutUs aboutUs;

  factory AboutUsResponse.fromJson(Map<String, dynamic> json) =>
      _$AboutUsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AboutUsResponseToJson(this);

  @override
  List<Object> get props => [aboutUs];
}

@JsonSerializable()
class AboutUs extends Equatable {
  AboutUs({
    required this.id,
    required this.key,
    required this.value,
  });

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'key')
  final String key;

  @JsonKey(name: 'value')
  final ValueAboutUs value;

  factory AboutUs.fromJson(Map<String, dynamic> json) =>
      _$AboutUsFromJson(json);

  Map<String, dynamic> toJson() => _$AboutUsToJson(this);

  @override
  List<Object> get props => [id, key, value];
}

@JsonSerializable()
class ValueAboutUs extends Equatable {
  ValueAboutUs({
    required this.key,
    required this.name,
    required this.desc,
    required this.facebook,
    required this.insta,
    required this.phoneAssistant,
    required this.phoneManager,
    required this.website,
    required this.ourMessage,
    required this.ourVision,
  });

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'key')
  final String key;

  @JsonKey(name: 'desc', defaultValue: '')
  final String desc;

  @JsonKey(name: 'insta', defaultValue: '')
  final String insta;

  @JsonKey(name: 'facebook', defaultValue: '')
  final String facebook;

  @JsonKey(name: 'phone_assistant')
  final String phoneAssistant;

  @JsonKey(name: 'phone_manager')
  final String phoneManager;

  @JsonKey(name: 'website', defaultValue: '')
  final String website;

  @JsonKey(name: 'our_message')
  final String ourMessage;

  @JsonKey(name: 'our_vision')
  final String ourVision;

  factory ValueAboutUs.fromJson(Map<String, dynamic> json) =>
      _$ValueAboutUsFromJson(json);

  Map<String, dynamic> toJson() => _$ValueAboutUsToJson(this);

  @override
  List<Object> get props => [
        key,
        name,
        desc,
        insta,
        facebook,
        phoneAssistant,
        phoneManager,
        website,
        ourMessage,
        ourVision
      ];
}
