import 'package:alnoormanment/shared/responsive/responsive.dart';
import 'package:alnoormanment/shared/thems.dart';
import 'package:alnoormanment/shared/widget/Button.widget.dart';
import 'package:alnoormanment/shared/widget/TextFormField_widget.dart';
import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/material.dart';

class Logein extends StatefulWidget {
  Logein({Key? key}) : super(key: key);

  @override
  _LogeinState createState() => _LogeinState();
}

class _LogeinState extends State<Logein> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Container(
          decoration: BoxDecoration(color: ColorPlatform.firstcolor),
          child: Row(
            children: [
              Expanded(
                  flex: Responsive.isMobile(context) ? 0 : 6,
                  child: Container()),
              Expanded(
                flex: 18,
                child: ListView(
                  children: [
                    Container(
                      height: 250,
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      width: double.infinity,
                      child: Image(image: AssetImage("images/logo.png")),
                    ),
                    Center(
                        child: Text(
                      StringPlatform.forexchange,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ColorPlatform.colorwhite),
                    )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Form(
                          child: Column(
                        children: [
                          Text_Form_Field(
                            Field_Name: "User Name",
                            obscure_Text: false,
                            Input_type: TextInputType.text,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Text_Form_Field(
                                Field_Name: "Password",
                                obscure_Text: true,
                                Input_type: TextInputType.text,
                              )),
                        ],
                      )),
                    ),
                    Row(
                      children: [
                        Expanded(flex: 2, child: Container()),
                        Expanded(
                          flex: 3,
                          child: Container(
                              height: 60,
                              width: double.infinity,
                              child: Button_widget(
                                  Button_Name: StringPlatform.login,
                                  Push_named: "BottomBar")),
                        ),
                        Expanded(flex: 2, child: Container()),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: Responsive.isMobile(context) ? 0 : 6,
                  child: Container()),
            ],
          ),
        )));
  }
}
