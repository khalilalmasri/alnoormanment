import 'package:alnoormanment/shared/responsive/responsive.dart';
import 'package:alnoormanment/shared/thems.dart';
import 'package:alnoormanment/shared/widget/Button.widget.dart';
import 'package:alnoormanment/shared/widget/Logo.widget.dart';
import 'package:alnoormanment/shared/widget/TextFormField_widget.dart';
import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool usr = true;
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
                      Field_Name: StringPlatform.username,
                      obscure_Text: false,
                      Input_type: TextInputType.text,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Text_Form_Field(
                                  Field_Name: StringPlatform.password,
                                  obscure_Text: true,
                                  Input_type: TextInputType.text)),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Text_Form_Field(
                                  Field_Name:
                                      StringPlatform.passwordconfirmation,
                                  obscure_Text: true,
                                  Input_type: TextInputType.text)),
                        ],
                      ),
                    ),
                    Text_Form_Field(
                      Field_Name: StringPlatform.mail,
                      obscure_Text: false,
                      Input_type: TextInputType.emailAddress,
                    ),
                    Button_widget(
                        Button_Name: StringPlatform.addimage, Push_named: ""),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.centerRight,
                          decoration: DecoPlatform.decotapbar,
                          height: 40,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text(
                                StringPlatform.responsibility,
                                style: StylePlatform.hinttext,
                              ),
                              items: [
                                StringPlatform.director,
                                StringPlatform.assistantdirector
                              ]
                                  .map((e) => DropdownMenuItem(
                                        child: Text("$e",
                                            style: StylePlatform.hinttext),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  responsibility = val;
                                });
                              },
                              value: responsibility,
                            ),
                          ),
                        ),
                      ],
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
