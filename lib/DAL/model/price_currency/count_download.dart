import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'count_download.g.dart';

@JsonSerializable()
class CountDownloadResponse extends Equatable {
  CountDownloadResponse({
    required this.count,
  });

  @JsonKey(name: 'data')
  final int count;


  factory CountDownloadResponse.fromJson(Map<String, dynamic> json) =>
      _$CountDownloadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountDownloadResponseToJson(this);
  @override
  List<Object> get props => [count];
}
