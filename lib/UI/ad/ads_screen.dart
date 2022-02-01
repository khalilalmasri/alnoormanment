import 'package:alnoormanment/BL/bloc/ads/ads_bloc.dart';
import 'package:alnoormanment/BL/bloc/ads/ads_state.dart';
import 'package:alnoormanment/BL/bloc/ads/bloc.dart';
import 'package:alnoormanment/DAL/model/ads/ad_body.dart';
import 'package:alnoormanment/DAL/web_services/api_price_currency_constant.dart';
import 'package:alnoormanment/UI/shared/widget/error/error.dart';
import 'package:alnoormanment/UI/shared/widget/progress/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/src/provider.dart';
import '../shared/responsive/responsive.dart';
import '../shared/thems.dart';
import '../shared/widget/Adv_manag.Widget.dart';
import '../shared/widget/Floating_Action_B.widget.dart';
import '../shared/words.dart';
import 'ad_new_screen.dart';

class AdsScreen extends StatefulWidget {
  static const String routeName = '/Advmanager';

  AdsScreen({Key? key}) : super(key: key);

  @override
  _AdsScreenState createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  bool usr = true;

  @override
  void initState() {
    super.initState();
    context.read<AdsBloc>().add(LoadAdsData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsBloc, AdsState>(builder: (context, state) {
      if (state is AdsHasData) {
        if (state.hasSubmitAd) {
          EasyLoading.showSuccess("تم الإضافة بنجاح");
          state.hasSubmitAd = false;
        }
        if (state.hasUpdateAd) {
          EasyLoading.showSuccess("تم التعديل بنجاح");
          state.hasUpdateAd = false;
        }
        if (state.hasDeleteAd) {
          EasyLoading.showSuccess("تم الحذف بنجاح");
          state.hasDeleteAd = false;
        }
        return _getPageContent();

    }

      else if (state is AdsLoading) {
        return Center(child: LoadingIndicator());
      } else if (state is AdsError) {
        return CustomErrorWidget(message: state.errorMessage);
      } else if (state is AdsNoData) {
        return CustomErrorWidget(message: state.message);
      } else if (state is AdsNoInternetConnection) {
        return _getPageContent();
      } else {
        return Center(child: Text("Something get Wrong "));
      }
    });
  }

  Widget _getPageContent() {
    List<Widget> ads = [];
    ApiPriceCurrencyConstant.AdsResponse.forEach((element) {
      ads.add(AdWidget(
        id: element.id,
        name: element.name,
        image: element.image.thumbnail,
        isBlocked: element.isActive,
      ));
    });

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPlatform.firstcolor,
        title: const Text(StringPlatform.advertismanage),
      ),
      floatingActionButton: FloatingActionBar(
        onPressed: () => Navigator.pushNamed(context, AddNewAdScreen.routeName,
            arguments: UpdateAdScreenArguments(AdBody(
              id: 0,
              name: '',
              image: '',
              isActive: false,
              link: '',
            ))),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: ColorPlatform.firstcolor),
        child: Row(
          children: [
            Expanded(
                flex: Responsive.isMobile(context) ? 0 : 6, child: Container()),
            Flexible(child: ListView(children: ads.map((e) => e).toList())),
            Expanded(
                flex: Responsive.isMobile(context) ? 0 : 6, child: Container()),
          ],
        ),
      ),
    ));
  }
}
