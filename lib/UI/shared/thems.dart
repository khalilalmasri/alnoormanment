import 'package:flutter/material.dart';

class ColorPlatform {

  static const Color ColorButton = Color(0xff413714);
  static const Color firstcolor = Color(0xff181712);
  static const Color secondcolor = Color(0xff8a7a25);
  static const Color thirddcolor = Color(0xffe2b746);
  static const Color golden = Color(0xffE6B31E);
  static const Color colorsix = Color(0x11000000);
  static const Color colorContainerBackground = Color(0xff181712);
  static const Color colorwhite = Color(0xffF0ECE3);
  static const Color colorgrey = Color(0xff607D8b);
  static  Color colorCapacityGrey = Color(0x74607d8b).withOpacity(0.2);
  static const Color ColorSix = Color(0x11000000);
  static const Color ColorCountDownload = Color(0xFF179fb5);
  static const Color ColorCountRefreshDownload = Color(0xFF1591a5);
  static const Color green = Colors.green;
  static const Color red = Colors.red;
}

class PaddingPlatform {
  static const EdgeInsets twenty = EdgeInsets.all(20);
  static const EdgeInsets ten = EdgeInsets.all(10);
  static const EdgeInsets five = EdgeInsets.all(5);
  static const EdgeInsets three = EdgeInsets.all(3);
}

class StylePlatform {
  static const TextStyle styleourmessag = TextStyle(
      fontFamily: "AMINE_MOD",
      height: 1.5,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: ColorPlatform.colorwhite);

  static const TextStyle stylesecondtile = TextStyle(
      fontFamily: "CONTHRAX-SB",
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: ColorPlatform.colorwhite);
  static const TextStyle stylesaleandbuywhite = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorPlatform.colorwhite);

  static const TextStyle stylesaleandbuy = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorPlatform.colorwhite);
  static const TextStyle Tilestyly = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorPlatform.colorwhite);
  static const TextStyle subtitle = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: ColorPlatform.firstcolor);

  static const TextStyle StyleTile = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: ColorPlatform.colorwhite);

  static const TextStyle formtext =
      TextStyle(color: ColorPlatform.golden, fontWeight: FontWeight.bold);
  static const TextStyle hinttext = TextStyle(color: ColorPlatform.colorgrey);
}

class DecoPlatform {
  static Decoration decoourmasseg = BoxDecoration(
      color: ColorPlatform.colorsix,
      borderRadius: BorderRadius.circular(25),
      border: Border.all(color: ColorPlatform.golden, width: 1));
  static final borderRadius = BorderRadius.circular(5.0);
  static Decoration buttonContactWhatsUp = BoxDecoration(
    color: ColorPlatform.ColorButton,
    borderRadius: BorderRadius.circular(30),
   );

  static Decoration decosecondcontailer = BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10), topRight: Radius.circular(10)),
  );
  static Decoration decosaleandbuyButton = BoxDecoration(
      color: ColorPlatform.ColorButton,
      borderRadius: BorderRadius.circular(30));
  static Decoration decosaleandbuy = BoxDecoration(
      color: ColorPlatform.firstcolor, borderRadius: BorderRadius.circular(3));
  static Decoration decotapbar = BoxDecoration(
      color: ColorPlatform.golden,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: ColorPlatform.firstcolor, width: 2));
  static Decoration DecoFirstMainContainer = BoxDecoration(
      color: ColorPlatform.ColorSix,
      border:
          Border(bottom: BorderSide(color: ColorPlatform.golden, width: 4)));
  static Decoration decofirstwide = BoxDecoration(
    color: ColorPlatform.golden,
    borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(
        begin: Alignment.bottomRight,
        colors: [ColorPlatform.firstcolor, ColorPlatform.golden]),
  );
  static InputDecoration decofild = InputDecoration(
      filled: true,
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: ColorPlatform.golden, width: 1)),
      focusedBorder:   OutlineInputBorder(borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ColorPlatform.golden, width: 1)),

      border: OutlineInputBorder(borderSide: BorderSide(width: 5)));
}
