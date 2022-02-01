import 'package:flutter/material.dart';
import '../thems.dart';
import '../words.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String Field_Name;
  final bool obscure_Text;
  final TextInputType Input_type;
  final TextEditingController? controller;

  const TextFormFieldWidget({
    Key? key,
    required this.Field_Name,
    required this.obscure_Text,
    required this.Input_type,
    this.controller,
  }) : super(key: key);

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child:  TextFormField(
          textDirection:TextDirection.ltr ,

          controller: widget.controller,
          cursorColor: ColorPlatform.colorwhite,
          obscureText: widget.obscure_Text,
          keyboardType: widget.Input_type,
          style:TextStyle(
              color: ColorPlatform.colorwhite, fontWeight: FontWeight.bold),
          onChanged: (value) {

            widget.controller!.text = value;
            widget.controller!.selection = TextSelection.fromPosition(TextPosition(offset: widget.controller!.text.length));
          },
          textAlign: TextAlign.end,
          decoration: DecoPlatform.decofild.copyWith(
              labelText: widget.Field_Name,
              labelStyle: StylePlatform.hinttext)),
    );
  }
}
