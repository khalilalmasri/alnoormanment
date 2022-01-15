import 'package:flutter/material.dart';
import '../thems.dart';
import '../words.dart';

class Button_widget extends StatefulWidget {
  final String Button_Name;
  final String Push_named;
  const Button_widget({
    Key? key,
    required this.Button_Name,
    required this.Push_named,
  }) : super(key: key);

  @override
  _Button_widget_PassState createState() => _Button_widget_PassState();
}

class _Button_widget_PassState extends State<Button_widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerRight,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            primary: ColorPlatform.golden,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(widget.Push_named);
          },
          child: Text(
            widget.Button_Name,
            style: StylePlatform.hinttext,
          )),
    );
  }
}
