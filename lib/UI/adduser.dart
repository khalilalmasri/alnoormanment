import 'package:alnoormanment/shared/responsive/responsive.dart';
import 'package:alnoormanment/shared/thems.dart';
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
            child: ListView(children: [
              Container(
                height: 90,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                child: Image(image: AssetImage("images/logo.png")),
              ),
              Text_Form_Field(Field_Name: StringPlatform.username),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          obscureText: true,
                          cursorColor: ColorPlatform.golden,
                          style: TextStyle(
                              color: ColorPlatform.golden,
                              fontWeight: FontWeight.bold),
                          onChanged: (value) {},
                          textAlign: TextAlign.end,
                          decoration: DecoPlatform.decofild.copyWith(
                              labelText: StringPlatform.password,
                              labelStyle: StylePlatform.hinttext)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          obscureText: true,
                          cursorColor: ColorPlatform.golden,
                          style: TextStyle(
                              color: ColorPlatform.golden,
                              fontWeight: FontWeight.bold),
                          onChanged: (value) {},
                          textAlign: TextAlign.end,
                          decoration: DecoPlatform.decofild.copyWith(
                              labelText: StringPlatform.passwordconfirmation,
                              labelStyle: StylePlatform.hinttext)),
                    ),
                  ],
                ),
              ),
              Text_Form_Field(Field_Name: StringPlatform.mail),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      primary: ColorPlatform.golden,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("HomePage");
                    },
                    child: const Text(
                      StringPlatform.addimage,
                      style: StylePlatform.hinttext,
                    )),
              ),
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
                                  child:
                                      Text("$e", style: StylePlatform.hinttext),
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
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      primary: ColorPlatform.golden,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("HomePage");
                    },
                    child: const Text(
                      StringPlatform.add,
                      style: StylePlatform.hinttext,
                    )),
              ),
            ]),
          ),
        ));
  }
}
