import 'package:flutter/material.dart';

class ColorPlatform {
  static const Color ColorButton = Color(0xff413714);
  static const Color firstcolor = Color(0xff181712);
  static const Color golden = Color(0xffE6B31E);
  static const Color colorwhite = Color(0xffF0ECE3);
  static const Color colorgrey = Color(0xff607D8b);
  static const Color ColorSix = Color(0x11000000);
  static const Color green = Colors.green;
  static const Color red = Colors.red;
}

class PaddingPlatform {
  static const EdgeInsets twenty = EdgeInsets.all(20);
}

class StylePlatform {
  static const TextStyle stylesaleandbuy = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorPlatform.colorwhite);
  static const TextStyle Tilestyly = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorPlatform.firstcolor);
  static const TextStyle subtitle = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: ColorPlatform.firstcolor);
 
  static const TextStyle formtext =
      TextStyle(color: ColorPlatform.golden, fontWeight: FontWeight.bold);
  static const TextStyle hinttext = TextStyle(color: ColorPlatform.colorgrey);
}

class DecoPlatform {
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
          OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ColorPlatform.golden, width: 5)),
      border: OutlineInputBorder(borderSide: BorderSide(width: 10)));
}
