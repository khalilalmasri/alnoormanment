import 'package:alnoormanment/shared/responsive/responsive.dart';
import 'package:alnoormanment/shared/thems.dart';
import 'package:alnoormanment/shared/widget/Button.widget.dart';
import 'package:alnoormanment/shared/widget/Logo.widget.dart';
import 'package:alnoormanment/shared/widget/TextFormField_widget.dart';
import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/material.dart';

class Add_Adv extends StatefulWidget {
  Add_Adv({Key? key}) : super(key: key);

  @override
  _Add_AdvState createState() => _Add_AdvState();
}

class _Add_AdvState extends State<Add_Adv> {
  bool adv = true;
  var responsibility;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPlatform.firstcolor,
            title: const Text(StringPlatform.Adduser),
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
                    Text_Form_Field(
                      Field_Name: StringPlatform.from,
                      obscure_Text: false,
                      Input_type: TextInputType.datetime,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Text_Form_Field(
                                  Field_Name: StringPlatform.to,
                                  obscure_Text: true,
                                  Input_type: TextInputType.datetime)),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Text_Form_Field(
                                  Field_Name:
                                      StringPlatform.discription,
                                  obscure_Text: false,
                                  Input_type: TextInputType.text)),
                        ],
                      ),
                    ),
                   
                    Button_widget(
                        Button_Name: StringPlatform.add, Push_named: ""),
                   
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
