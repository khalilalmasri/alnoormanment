import 'dart:async';
import 'package:alnoormanment/BL/bloc/splash/bloc.dart';
import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:alnoormanment/UI/Bottom_Bar.dart';
import 'package:alnoormanment/UI/auth/login.dart';
import 'package:alnoormanment/UI/currency/managecurrency.dart';
import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:alnoormanment/UI/shared/widget/error/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:package_info/package_info.dart';

// import 'file_manager.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String logStr = '';

  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(LoadSplashData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPlatform.colorgrey,
      body: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          if (state is SplashHasData) {
            _startSplashScreenToHomePage(state.user);
            return _getPageContent();
          } else if (state is SplashNotAuthenticated) {

            _startLoginScreen();
            return _getPageContent();
          } else if (state is SplashLoading) {
            return _getPageContent();
          } else if (state is SplashError) {
            return CustomErrorWidget(message: state.errorMessage);
          } else if (state is SplashNoData) {
            return CustomErrorWidget(message: state.message);
          } else if (state is SplashNoInternetConnection) {

            _startLoginScreen();
            return _getPageContent();
            // return NoInternetWidget(
            //   message: AppConstant.noInternetConnection,
            //   onPressed: () {
            //     context.read<SplashBloc>().add(LoadSplashData());
            //   },
            // );

          } else {
            return Center(child: Text("Something get Wrong "));
          }
        },
      ),
    );
  }

  Widget _getPageContent() {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: ColorPlatform.colorgrey,
                child: Container(),
              )),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: Image.asset(
                'images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FutureBuilder<String>(
              future: _getVersion(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                var verInfo = "";
                if (snapshot.hasData) {
                  verInfo = "v ${snapshot.data}";
                }
                return Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.width / 13.8),
                  child: Text(
                    verInfo,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorPlatform.colorgrey),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _getVersion() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    return info.version;
  }

  _startSplashScreenToHomePage(User user) {
    var _duration = Duration(milliseconds: 50);
    return Timer(_duration, () => _navigationHomePage(user));
  }

  void _navigationHomePage(User user) {
    if (user.userRole == "AD")
      Navigator.of(context).pushNamedAndRemoveUntil(
      HomeScreen.routeName, (Route<dynamic> route) => false);
  }

  _startLoginScreen() async {
    var _duration = Duration(milliseconds: 50);
    return Timer(_duration, _navigationLoginPage);
  }

  void _navigationLoginPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        LoginScreen.routeName, (Route<dynamic> route) => false);
  }
}
