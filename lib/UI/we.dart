import 'package:alnoormanment/shared/responsive/responsive.dart';
import 'package:alnoormanment/shared/thems.dart';
import 'package:alnoormanment/shared/widget/Button.widget.dart';
import 'package:alnoormanment/shared/widget/Logo.widget.dart';
import 'package:alnoormanment/shared/widget/TextFormField_widget.dart';
import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/material.dart';

class We extends StatefulWidget {
  We({Key? key}) : super(key: key);

  @override
  _WeState createState() => _WeState();
}

class _WeState extends State<We> {
  bool usr = true;
  var responsibility;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPlatform.firstcolor,
            title: const Text(StringPlatform.we),
          ),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: ColorPlatform.firstcolor),
            child: Row(
                children: [
                  Expanded(
                      flex: Responsive.isMobile(context) ? 0 : 6,
                      child: Container()),
                  Expanded(
                    flex: 18,
            child: ListView(children: [
              Logo_widget(),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text_Form_Field(Field_Name: StringPlatform.FirstNumber, obscure_Text: false, Input_type:TextInputType.phone)
                    ),
                    /*Container(
                      width: 120,
                      alignment: Alignment.center,
                      decoration: DecoPlatform.decotapbar,
                      height: 65,
                      child: Text(
                        StringPlatform.name,
                        style: StylePlatform.tilestyly,
                      ),
                    ),*/
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text_Form_Field(Field_Name: StringPlatform.SecondNumber, obscure_Text: false, Input_type:TextInputType.phone)
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text_Form_Field(Field_Name: StringPlatform.web, obscure_Text:false, Input_type:TextInputType.text)
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text_Form_Field(Field_Name: StringPlatform.FaceBook, obscure_Text: false, Input_type: TextInputType.text)
                    ),
                  ],
                ),
              ),
              Button_widget(Button_Name: StringPlatform.add, Push_named: "")
            ]),
 ),
                  Expanded(
                      flex: Responsive.isMobile(context) ? 0 : 6,
                      child: Container()),
                ],
              ),
          ),
          
        ));
  }
}
