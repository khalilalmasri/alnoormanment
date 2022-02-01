// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_download.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountDownloadResponse _$CountDownloadResponseFromJson(
    Map<String, dynamic> json) {
  return CountDownloadResponse(
    count: json['data'] as int,
  );
}

Map<String, dynamic> _$CountDownloadResponseToJson(
        CountDownloadResponse instance) =>
    <String, dynamic>{
      'data': instance.count,
    };
