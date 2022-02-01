import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:flutter/material.dart';


class TextFieldAboutWidget extends StatefulWidget {
  final String Field_Name;

  final TextEditingController? controller;

  const TextFieldAboutWidget({
    Key? key,
    required this.Field_Name,

    this.controller,
  }) : super(key: key);

  @override
  _TextFieldAboutWidgetState createState() => _TextFieldAboutWidgetState();
}

class _TextFieldAboutWidgetState extends State<TextFieldAboutWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child:  TextFormField(maxLines: 4,
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
          decoration: DecoPlatform.decofild.copyWith(
              labelText: widget.Field_Name,
              labelStyle: StylePlatform.hinttext)
      ),
    );
  }
}
