import 'package:alnoormanment/shared/responsive/responsive.dart';
import 'package:alnoormanment/shared/thems.dart';
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
            child: ListView(children: [
              Container(
                height: 90,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                child: Image(image: AssetImage("images/logo.png")),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          keyboardType: TextInputType.phone,
                          cursorColor: ColorPlatform.golden,
                          style: TextStyle(
                              color: ColorPlatform.golden,
                              fontWeight: FontWeight.bold),
                          onChanged: (value) {},
                          textAlign: TextAlign.end,
                          decoration: DecoPlatform.decofild.copyWith(
                              labelText: StringPlatform.FirstNumber,
                              labelStyle: StylePlatform.hinttext)),
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
                      child: TextFormField(
                          keyboardType: TextInputType.phone,
                          cursorColor: ColorPlatform.golden,
                          style: TextStyle(
                              color: ColorPlatform.golden,
                              fontWeight: FontWeight.bold),
                          onChanged: (value) {},
                          textAlign: TextAlign.end,
                          decoration: DecoPlatform.decofild.copyWith(
                              labelText: StringPlatform.SecondNumber,
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
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: ColorPlatform.golden,
                          style: TextStyle(
                              color: ColorPlatform.golden,
                              fontWeight: FontWeight.bold),
                          onChanged: (value) {},
                          textAlign: TextAlign.end,
                          decoration: DecoPlatform.decofild.copyWith(
                              labelText: StringPlatform.web,
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
                          cursorColor: ColorPlatform.golden,
                          style: TextStyle(
                              color: ColorPlatform.golden,
                              fontWeight: FontWeight.bold),
                          onChanged: (value) {},
                          textAlign: TextAlign.end,
                          keyboardType: TextInputType.emailAddress,
                          decoration: DecoPlatform.decofild.copyWith(
                              labelText: StringPlatform.FaceBook,
                              labelStyle: StylePlatform.hinttext)),
                    ),
                  ],
                ),
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
