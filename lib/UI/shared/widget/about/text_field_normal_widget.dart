import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:flutter/material.dart';


class TextFieldAboutNormalWidget extends StatefulWidget {
  final String Field_Name;
  final TextInputType Input_type;
  final TextEditingController? controller;

  const TextFieldAboutNormalWidget({
    Key? key,
    required this.Field_Name,

    this.controller,required this.Input_type,
  }) : super(key: key);

  @override
  _TextFieldAboutNormalWidgetState createState() => _TextFieldAboutNormalWidgetState();
}

class _TextFieldAboutNormalWidgetState extends State<TextFieldAboutNormalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child:  TextFormField(

          keyboardType: widget.Input_type,
          textDirection: TextDirection.rtl,
          controller: widget.controller,
          cursorColor: ColorPlatform.colorwhite,
          obscureText:false,
          style: const TextStyle(
              color: ColorPlatform.colorwhite, fontWeight: FontWeight.bold),
          onChanged: (value) {
            widget.controller!.text = value;
            widget.controller!.selection = TextSelection.fromPosition(TextPosition(offset: widget.controller!.text.length));
          },
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              filled: true,
              enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: ColorPlatform.golden, width: 1)),
              focusedBorder:   OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: ColorPlatform.golden, width: 1)),

              border: OutlineInputBorder(borderSide: BorderSide(width: 5))).copyWith(
              labelText: widget.Field_Name,
              labelStyle: StylePlatform.hinttext)
      ),
    );
  }
}
