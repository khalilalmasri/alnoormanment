import 'package:path/path.dart' as p;
import 'dart:io';
import 'dart:convert';


class CastModelsType {
  static castToInt(value) {
    if (value == null) return null;
    return value.runtimeType == String ? double.parse(value).round() : value;
  }

  static castToDouble(value) {
    if (value == null) return null;
    return value.runtimeType == String ? double.parse(value) : value;
  }

  static castFromDoubleToString(value) {
    if (value == null) return null;
    return value.runtimeType == double ? value.toString() : value;
  }

  static castFromStringToBoolean(value) {
    if (value.runtimeType == bool) return value;

    return (value.runtimeType == String
                ? double.parse(value).round()
                : value) ==
            0
        ? false
        : true;
  }

  static castDateTimeToFormat(value) {
    if (value == null) return null;

    return value.runtimeType == String ? DateTime.parse(value) : value;
  }

  // static castDateTimeToHumanValue(value) {
  //   if (value == null) return null;
  //
  //   var date = value.runtimeType == String ? DateTime.parse(value) : value;
  //
  //   return timeAgo.format(date,
  //       locale: ApiUserConstant.language, allowFromNow: true);
  // }

  static getImageBase64(File file) {
    return 'data:image/' +
        p.extension(file.path).substring(1) +
        ';base64,' +
        Base64Encoder().convert(file.readAsBytesSync());
  }

  static getImagesBase64(List<File> files) {
    List<String> list = List<String>.empty();

    files.forEach((file) => list.add(getImageBase64(file)));

    return list;
  }
}
