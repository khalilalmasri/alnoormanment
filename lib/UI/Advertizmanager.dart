import 'package:alnoormanment/shared/responsive/responsive.dart';
import 'package:alnoormanment/shared/thems.dart';
import 'package:alnoormanment/shared/widget/Adv_manag.Widget.dart';
import 'package:alnoormanment/shared/widget/Floating_Action_B.widget.dart';
import 'package:alnoormanment/shared/widget/Users_widget.dart';
import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/material.dart';

class Advsmanager extends StatefulWidget {
  Advsmanager({Key? key}) : super(key: key);

  @override
  _AdvsmanagerState createState() => _AdvsmanagerState();
}

class _AdvsmanagerState extends State<Advsmanager> {
  bool usr = true;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPlatform.firstcolor,
            title: const Text(StringPlatform.users),
          ),
          floatingActionButton: Floating_Action_B(Path: "AddAdv"),
          
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
              Container(
                height: 90,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                child: Image(image: AssetImage("images/logo.png")),
              ),
              Adv_Widget(Description: "Description", Adv_Image: "")
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
