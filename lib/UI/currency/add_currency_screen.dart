import 'package:alnoormanment/UI/shared/responsive/responsive.dart';
import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:alnoormanment/UI/shared/widget/Button.widget.dart';
import 'package:alnoormanment/UI/shared/widget/Logo.widget.dart';
import 'package:alnoormanment/UI/shared/widget/text_form_field_widget.dart';
import 'package:alnoormanment/UI/shared/words.dart';
import 'package:flutter/material.dart';



class AddCurrencyScreen extends StatefulWidget {
  AddCurrencyScreen({Key? key}) : super(key: key);

  @override
  _AddCurrencyScreenState createState() => _AddCurrencyScreenState();
}

class _AddCurrencyScreenState extends State<AddCurrencyScreen> {
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
            child: Row(
              children: [
                Expanded(
                    flex: Responsive.isMobile(context) ? 0 : 6,
                    child: Container()),
                Expanded(
                  flex: 18,
                  child: ListView(children: [
                    Logo_widget(),
                    TextFormFieldWidget(
                      Field_Name: StringPlatform.Currencyname,
                      obscure_Text: false,
                      Input_type: TextInputType.text,
                    ),
                    TextFormFieldWidget(
                      Field_Name: StringPlatform.Currincysymbol,
                      obscure_Text: false,
                      Input_type: TextInputType.text,
                    ),
                    ButtonWidget(
                        Button_Name: StringPlatform.add, Push_named: "")
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
