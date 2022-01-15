import 'package:flutter/material.dart';
import '../thems.dart';
import '../words.dart';

class Text_Form_Field extends StatefulWidget {
  final String Field_Name;
  final bool obscure_Text;
  final TextInputType Input_type;
  const Text_Form_Field({
    Key? key,
    required this.Field_Name,
    required this.obscure_Text,
    required this.Input_type,
  }) : super(key: key);

  @override
  _Text_Form_FieldState createState() => _Text_Form_FieldState();
}

class _Text_Form_FieldState extends State<Text_Form_Field> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: TextFormField(
          cursorColor: ColorPlatform.golden,
          obscureText: widget.obscure_Text,
          keyboardType: widget.Input_type,
          style: TextStyle(
              color: ColorPlatform.golden, fontWeight: FontWeight.bold),
          onChanged: (value) {},
          textAlign: TextAlign.end,
          decoration: DecoPlatform.decofild.copyWith(
              labelText: widget.Field_Name,
              labelStyle: StylePlatform.hinttext)),
    );
  }
}
