import 'package:flutter/material.dart';
import '../thems.dart';
import '../words.dart';

class ButtonWidget extends StatefulWidget {
  final String Button_Name;
  final String Push_named;
  final VoidCallback? onPressed;

  ButtonWidget({
    Key? key,
    required this.Button_Name,
    required this.Push_named,
    this.onPressed,
  }) : super(key: key);

  @override
  _Button_widget_PassState createState() => _Button_widget_PassState();
}

class _Button_widget_PassState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: DecoPlatform.buttonContactWhatsUp,
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: MaterialButton(
          onPressed: widget.onPressed,
          child: Text(widget.Button_Name, style: StylePlatform.StyleTile),
        ));
  }
}
