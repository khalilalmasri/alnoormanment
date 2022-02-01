import 'package:flutter/material.dart';

import '../../../main.dart';
import '../thems.dart';
import '../words.dart';

class Add_Currency_Widget extends StatefulWidget {
  final String Currency_name_E;
  final String Currency_name_A;
  const Add_Currency_Widget({
    Key? key,
    required this.Currency_name_E,
    required this.Currency_name_A,
  }) : super(key: key);

  @override
  _Add_Currency_WidgetState createState() => _Add_Currency_WidgetState();
}

class _Add_Currency_WidgetState extends State<Add_Currency_Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
      height: 80,
      child: RadioListTile(
          activeColor: ColorPlatform.green,
          selected: currency == widget.Currency_name_E ? true : false,
          title: Text(
            widget.Currency_name_E,
            style: StylePlatform.stylesaleandbuy,
          ),
          secondary: Text(
            widget.Currency_name_A,
            style: StylePlatform.stylesaleandbuy,
          ),
          selectedTileColor: ColorPlatform.green,
          value: widget.Currency_name_E,
          groupValue: currency,
          onChanged: (val) {
            setState(() {
              currency = val;
            });
          }),
    );
  }
}
