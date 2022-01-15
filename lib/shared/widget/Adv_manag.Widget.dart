import 'package:flutter/material.dart';
import '../thems.dart';
import '../words.dart';

class Adv_Widget extends StatefulWidget {
  final String Description;
  final String Adv_Image;

  const Adv_Widget({
    Key? key,
    required this.Description,
    required this.Adv_Image,
  }) : super(key: key);

  @override
  _Adv_WidgetState createState() => _Adv_WidgetState();
}

class _Adv_WidgetState extends State<Adv_Widget> {
  bool adv = true;
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
          widget.Description,
          style: StylePlatform.Tilestyly,
        ),
        subtitle: Text(
         "description",
          style: StylePlatform.subtitle,
        ),
        leading: Switch(
          value: adv,
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
