import 'package:alnoormanment/shared/responsive/responsive.dart';
import 'package:alnoormanment/shared/thems.dart';
import 'package:alnoormanment/shared/widget/TextFormField_widget.dart';
import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/material.dart';

class Add_Currency extends StatefulWidget {
  Add_Currency({Key? key}) : super(key: key);

  @override
  _Add_CurrencyState createState() => _Add_CurrencyState();
}

class _Add_CurrencyState extends State<Add_Currency> {
  var responsibility;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPlatform.firstcolor,
            title: const Text(StringPlatform.add),
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
              Text_Form_Field(Field_Name: StringPlatform.Currencyname),
              Text_Form_Field(Field_Name: StringPlatform.Currincysymbol),
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
