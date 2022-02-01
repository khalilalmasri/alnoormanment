import 'dart:io';
import 'package:alnoormanment/DAL/model/CastModelsType.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ad_request.g.dart';

@JsonSerializable()
class AdRequest extends Equatable {
  AdRequest({
    required this.name,
    required this.image,
    required this.link,
    required this.isActive,
     this.id,
  });

  @JsonKey(name: 'ad_id',toJson: CastModelsType.castToInt)
  final int? id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'image')
  final String image;

  @JsonKey(name: 'link')
  final String link;

  // final DateTime fromDate;

  @JsonKey(name: 'is_active')
  final bool isActive;

  factory AdRequest.fromJson(Map<String, dynamic> json) =>
      _$AdRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AdRequestToJson(this);

  @override
  List<Object> get props => [name, image, link, isActive];
}
