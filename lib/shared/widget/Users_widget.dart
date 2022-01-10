import 'package:flutter/material.dart';

import '../thems.dart';
import '../words.dart';

class Users_Widget extends StatefulWidget {
  final String User_Name;
  final String User_Image;

  const Users_Widget({
    Key? key,
    required this.User_Name,
    required this.User_Image,
  }) : super(key: key);

  @override
  _Users_WidgetState createState() => _Users_WidgetState();
}

class _Users_WidgetState extends State<Users_Widget> {
  bool usr = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 120,
      decoration: BoxDecoration(
        color: ColorPlatform.golden,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: ListTile(
        title: Text(
          widget.User_Name,
          style: StylePlatform.Tilestyly,
        ),
        subtitle: Text(
          StringPlatform.username,
          style: StylePlatform.subtitle,
        ),
        leading: Switch(
          value: usr,
          onChanged: (val) {},
          activeColor: ColorPlatform.green,
          inactiveThumbColor: ColorPlatform.red,
          inactiveTrackColor: ColorPlatform.golden,
          activeTrackColor: ColorPlatform.golden,
        ),
        trailing: Container(
            height: 100,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("images/2.png")),
            )),
      ),
    );
  }
}
