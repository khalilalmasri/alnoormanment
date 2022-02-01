import 'dart:io';
import 'package:alnoormanment/BL/bloc/ads/ads_bloc.dart';
import 'package:alnoormanment/BL/bloc/ads/bloc.dart';
import 'package:alnoormanment/DAL/model/CastModelsType.dart';
import 'package:alnoormanment/DAL/model/ads/ad_body.dart';
import 'package:alnoormanment/DAL/model/ads/ad_request.dart';
import 'package:alnoormanment/UI/shared/widget/error/error.dart';
import 'package:alnoormanment/UI/shared/widget/handel_image/image_handel.dart';
import 'package:alnoormanment/UI/shared/widget/progress/progress.dart';
import 'package:alnoormanment/UI/shared/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/src/provider.dart';
import '../shared/responsive/responsive.dart';
import '../shared/thems.dart';
import '../shared/widget/Button.widget.dart';
import '../shared/words.dart';

class AddNewAdScreen extends StatefulWidget {
  static const routeName = '/ads/add_new';
  final AdBody ad;

  AddNewAdScreen(this.ad);

  @override
  _AddNewAdScreenState createState() => _AddNewAdScreenState();
}

class _AddNewAdScreenState extends State<AddNewAdScreen> {
  late TextEditingController nameController;
  bool adv = true;
  var responsibility;
  File? fileImage = null;

  @override
  void initState() {
    nameController = TextEditingController();
    nameController.text = widget.ad.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: ColorPlatform.firstcolor,
          appBar: AppBar(
            backgroundColor: ColorPlatform.firstcolor,
            title: Text(widget.ad.id != 0
                ? StringPlatform.editAd + ' ' + widget.ad.name
                : StringPlatform.addNewAd),
          ),
          body: BlocBuilder<AdsBloc, AdsState>(builder: (context, state) {
            if (state is AdsHasData) {
              return _getPageContent();
            } else if (state is AdsLoading) {
              return LoadingIndicator();
            } else if (state is AdsError) {
              List<String> errors = [];
              if (state.statusCode == 422)
                Map<String, dynamic>.from(state.errors).forEach((key, value) {
                  if (key == 'errors') {
                    Map<String, dynamic>.from(value).forEach((k, v) {
                      errors.add(v[0].toString());
                    });
                  }
                });
              String err = '';
              errors.forEach((element) {
                err += '\n ' + element;
              }
                  // var status = state.errors as List<String>;
                  );

              EasyLoading.showError(err.toString());
              return Stack(
                children: [
                  _getPageContent(),
                ],
              );
            } else if (state is AdsNoInternetConnection) {
              return NoInternetWidget(
                  message: 'يجب عليك الاتصال بالانترنت اولا', onPressed: () {});
            } else {
              return Center(child: Text("Something get wrong"));
            }
          }),
        ));
  }

  Widget _getPageContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: Responsive.isMobile(context) ? 0 : 6, child: Container()),
          Expanded(
            flex: 18,
            child: ListView(children: [
              widget.ad.id != 0
                  ? ImageHandler(
                      onCallFunction: (File file) {
                        fileImage = file;
                      },
                      onRemoveFunction: (File file) {},
                      url: widget.ad.image,
                    )
                  :
                  // Container(
                  //         margin: EdgeInsets.symmetric(
                  //             vertical: 20, horizontal: 10),
                  //         child: Image(
                  //             image: AssetImage("images/ad_with_us.png")),
                  //       )
                  ImageHandler(
                      onCallFunction: (File file) {
                        fileImage = file;
                      },
                      onRemoveFunction: (File file) {},
                      url: null,
                    ),
              // TextFormFieldWidget(
              //   Field_Name: StringPlatform.name,
              //   obscure_Text: false,
              //   Input_type: TextInputType.text,
              //   controller: nameController,
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Switch(
                      value: widget.ad.isActive,
                      onChanged: (val) {
                        setState(() {
                          widget.ad.isActive = val;
                        });
                      },
                      activeColor: ColorPlatform.green,
                      inactiveThumbColor: ColorPlatform.red,
                      inactiveTrackColor: ColorPlatform.ColorButton,
                      activeTrackColor: ColorPlatform.ColorButton,
                    ),
                    Text(
                      'تفعيل',
                      style: TextStyle(color: ColorPlatform.colorwhite),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: ButtonWidget(
                  Button_Name: widget.ad.id == 0
                      ? StringPlatform.add
                      : StringPlatform.edit,
                  Push_named: "",
                  onPressed: () {
                    // if (nameController.text.isEmpty)
                    //   EasyLoading.showError('الاسم مطلوب');
                     if (fileImage == null&&  widget.ad.id == 0) {
                      EasyLoading.showError('الصورة مطلوبة ');
                    } else
                      widget.ad.id == 0
                          ? context.read<AdsBloc>().add(AddAd(
                              context: context,
                              newAd: AdRequest(
                                  isActive: widget.ad.isActive,
                                  link: '',
                                  name: 'ad Image',
                                  image: fileImage == null
                                      ? widget.ad.image
                                      : CastModelsType.getImageBase64(
                                          fileImage!))))
                          : context.read<AdsBloc>().add(UpdateAd(
                              context: context,
                              ad: AdRequest(
                                  id: widget.ad.id,
                                  isActive: widget.ad.isActive,
                                  link: '',
                                  name: nameController.text,
                                  image: fileImage == null
                                      ? widget.ad.image
                                      : CastModelsType.getImageBase64(
                                          fileImage!))));
                  },
                ),
              ),
              widget.ad.id != 0
                  ? Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: ColorPlatform.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 40,
                      margin: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 10),
                      child: MaterialButton(
                        onPressed: () {
                          context.read<AdsBloc>().add(DeleteAd(
                              context: context,
                              existAd: AdRequest(
                                  id: widget.ad.id,
                                  isActive: widget.ad.isActive,
                                  link: '',
                                  name: nameController.text,
                                  image: widget.ad.image)));
                        },
                        child: Text(StringPlatform.delete,
                            style: StylePlatform.StyleTile),
                      ))
                  : Container(),
            ]),
          ),
          Expanded(
              flex: Responsive.isMobile(context) ? 0 : 6, child: Container()),
        ],
      ),
    );
  }
}

class UpdateAdScreenArguments {
  final AdBody ad;

  UpdateAdScreenArguments(this.ad);
}
