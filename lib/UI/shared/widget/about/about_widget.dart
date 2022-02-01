import 'package:alnoormanment/BL/bloc/about/about_bloc.dart';
import 'package:alnoormanment/BL/bloc/about/bloc.dart';
import 'package:alnoormanment/BL/bloc/price_currency/bloc.dart';
import 'package:alnoormanment/DAL/model/about_us/about_us.dart';
import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:alnoormanment/UI/shared/widget/about/text_field_normal_widget.dart';
import 'package:alnoormanment/UI/shared/words.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../Button.widget.dart';
import 'text_field_about_widget.dart';

class AboutWidget extends StatefulWidget {
  final String manager_phone;
  final String assistant_phone;
  final String website;
  final String facebook;
  final String company_name;
  final String our_message;
  final String our_vision;
  final String note;
  final String address;

  const AboutWidget({
    Key? key,
    required this.manager_phone,
    required this.assistant_phone,
    required this.website,
    required this.facebook,
    required this.company_name,
    required this.our_message,
    required this.our_vision,
    required this.note,
    required this.address,
  }) : super(key: key);

  @override
  _AboutUsWidgetState createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutWidget> {
  late TextEditingController companyNameController;
  late TextEditingController exchangeNumberController;
  late TextEditingController transferNumberController;
  late TextEditingController visionController;
  late TextEditingController messageController;
  late TextEditingController noteController;
  late TextEditingController facebookController;
  late TextEditingController websiteController;
  late TextEditingController instaController;

  @override
  void initState() {
    companyNameController = TextEditingController();
    exchangeNumberController = TextEditingController();
    transferNumberController = TextEditingController();
    visionController = TextEditingController();
    messageController = TextEditingController();
    noteController = TextEditingController();
    facebookController = TextEditingController();
    websiteController = TextEditingController();
    instaController = TextEditingController();

    companyNameController.text = widget.company_name;
    exchangeNumberController.text = widget.manager_phone;
    transferNumberController.text = widget.assistant_phone;
    visionController.text = widget.our_vision;
    messageController.text = widget.our_message;
    noteController.text = widget.note;
    facebookController.text = widget.facebook;
    websiteController.text = widget.website;
    instaController.text = widget.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPlatform.colorContainerBackground,
      ),
      width: double.infinity,
      padding: PaddingPlatform.twenty,
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: DecoPlatform.decosaleandbuy,
            padding: PaddingPlatform.three,
            height: 40,
            margin: PaddingPlatform.five,
            child: Text(StringPlatform.forcomunication,
                style: StylePlatform.stylesaleandbuy),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 40,
                    margin: PaddingPlatform.five,
                    child: Text(StringPlatform.exchange,
                        style: StylePlatform.styleourmessag),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 120,
                    margin: PaddingPlatform.five,
                    child: TextFieldAboutNormalWidget(
                      Field_Name: StringPlatform.exchange,
                      controller: exchangeNumberController,
                      Input_type: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 40,
                    margin: PaddingPlatform.five,
                    child: Text(StringPlatform.transferr,
                        style: StylePlatform.styleourmessag),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 120,
                    margin: PaddingPlatform.five,
                    child: TextFieldAboutNormalWidget(
                      Field_Name: StringPlatform.transferr,
                      controller: transferNumberController,
                      Input_type: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 40,
                    margin: PaddingPlatform.five,
                    child: Text(StringPlatform.web,
                        style: StylePlatform.styleourmessag),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 120,
                    margin: PaddingPlatform.five,
                    child: TextFieldAboutNormalWidget(
                      Field_Name: StringPlatform.web,
                      controller: websiteController,
                      Input_type: TextInputType.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 40,
                    margin: PaddingPlatform.five,
                    child: Text(StringPlatform.facebook,
                        style: StylePlatform.styleourmessag),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 120,
                    margin: PaddingPlatform.five,
                    child: TextFieldAboutNormalWidget(
                      Field_Name: StringPlatform.facebook,
                      controller: facebookController,
                      Input_type: TextInputType.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 40,
                    margin: PaddingPlatform.five,
                    child: Text(StringPlatform.note,
                        style: StylePlatform.styleourmessag),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 120,
                    margin: PaddingPlatform.five,
                    child: TextFieldAboutNormalWidget(
                      Field_Name: StringPlatform.note,
                      controller: noteController,
                      Input_type: TextInputType.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 40,
                    margin: PaddingPlatform.five,
                    child: Text(StringPlatform.nameCompany,
                        style: StylePlatform.styleourmessag),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 120,
                    margin: PaddingPlatform.five,
                    child: TextFieldAboutNormalWidget(
                      Field_Name: StringPlatform.nameCompany,
                      controller: companyNameController,
                      Input_type: TextInputType.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 40,
                    margin: PaddingPlatform.five,
                    child: Text(StringPlatform.address,
                        style: StylePlatform.styleourmessag),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: DecoPlatform.decosaleandbuy,
                    padding: PaddingPlatform.three,
                    height: 120,
                    margin: PaddingPlatform.five,
                    child: TextFieldAboutNormalWidget(
                      Field_Name: StringPlatform.address,
                      controller: instaController,
                      Input_type: TextInputType.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            padding: PaddingPlatform.ten,
            decoration: DecoPlatform.decosaleandbuyButton,
            child: Center(
              child: Text(
                StringPlatform.masseg,
                style: StylePlatform.stylesaleandbuy,
              ),
            ),
          ),
          Container(
            margin: PaddingPlatform.three,
            padding: PaddingPlatform.twenty,
            child: TextFieldAboutWidget(
              Field_Name: StringPlatform.masseg,
              controller: messageController,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            padding: PaddingPlatform.ten,
            decoration: DecoPlatform.decosaleandbuyButton,
            child: Center(
              child: Text(
                StringPlatform.vision,
                style: StylePlatform.stylesaleandbuy,
              ),
            ),
          ),
          Container(
            margin: PaddingPlatform.three,
            padding: PaddingPlatform.twenty,
            child: TextFieldAboutWidget(
              Field_Name: StringPlatform.vision,
              controller: visionController,
            ),
          ),
          ButtonWidget(
            Push_named: '',
            onPressed: () {
              context.read<AboutBloc>().add(UpdateAbout(
                  aboutUs: ValueAboutUs(
                      insta: instaController.text,
                      phoneManager: exchangeNumberController.text,
                      ourVision: visionController.text,
                      name: companyNameController.text,
                      key: 'company_info',
                      website: websiteController.text,
                      desc: noteController.text,
                      ourMessage: messageController.text,
                      facebook: facebookController.text,
                      phoneAssistant: transferNumberController.text)));
            },
            Button_Name: 'تحديث ',
          )
        ],
      ),
    );
  }
}
