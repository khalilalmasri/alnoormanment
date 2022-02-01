import 'package:flutter/material.dart';

class Logo_widget extends StatefulWidget {
  Logo_widget({Key? key}) : super(key: key);

  @override
  _Logo_widgetState createState() => _Logo_widgetState();
}

class _Logo_widgetState extends State<Logo_widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
                      height: 90,
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      width: double.infinity,
                      child: Image(image: AssetImage("images/logo.png")),
                    );
  }
}