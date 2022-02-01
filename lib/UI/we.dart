import 'package:alnoormanment/BL/bloc/about/about_bloc.dart';
import 'package:alnoormanment/BL/bloc/about/about_event.dart';
import 'package:alnoormanment/BL/bloc/about/about_state.dart';
import 'package:alnoormanment/DAL/web_services/api_constant.dart';
import 'package:alnoormanment/DAL/web_services/api_price_currency_constant.dart';
import 'package:alnoormanment/UI/shared/widget/about/about_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/src/provider.dart';
import 'shared/thems.dart';
import 'shared/widget/error/error.dart';
import 'shared/widget/progress/progress.dart';
import 'shared/words.dart';

class We extends StatefulWidget {
  We({Key? key}) : super(key: key);

  @override
  _WeState createState() => _WeState();
}

class _WeState extends State<We> {
  bool usr = true;
  var responsibility;

  @override
  void initState() {
    context.read<AboutBloc>().add(LoadAboutData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutBloc, AboutState>(builder: (context, state) {
      if (state is AboutUsHasData) {
        if (state.hasUpdateAbout) {
          EasyLoading.showSuccess("تم التعديل بنجاح");
          state.hasUpdateAbout = false;
        }
        return _getPageContent();
      } else if (state is AboutUsLoading) {
        return Center(child: LoadingIndicator());
      } else if (state is AboutUsError) {
        return CustomErrorWidget(message: state.errorMessage);
      } else if (state is AboutUsNoData) {
        return CustomErrorWidget(message: state.message);
      } else if (state is AboutUsNoInternetConnection) {
        return _getPageContent();
      } else {
        return Center(child: Text("Something get Wrong "));
      }
    });
  }

  Widget _getPageContent() {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPlatform.firstcolor,
            title: const Text(StringPlatform.we),
          ),
          body: AboutWidget(
            assistant_phone:
                ApiPriceCurrencyConstant.aboutUs!.value.phoneAssistant,
            our_message: ApiPriceCurrencyConstant.aboutUs!.value.ourMessage,
            company_name: ApiPriceCurrencyConstant.aboutUs!.value.name,
            our_vision: ApiPriceCurrencyConstant.aboutUs!.value.ourVision,
            note: ApiPriceCurrencyConstant.aboutUs!.value.desc,
            website: ApiPriceCurrencyConstant.aboutUs!.value.website,
            manager_phone: ApiPriceCurrencyConstant.aboutUs!.value.phoneManager,
            facebook: ApiPriceCurrencyConstant.aboutUs!.value.facebook,
            address: ApiPriceCurrencyConstant.aboutUs!.value.insta,
          ),
        ));
  }
}
