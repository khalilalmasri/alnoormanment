import 'package:alnoormanment/BL/bloc/about/about_bloc.dart';
import 'package:alnoormanment/BL/bloc/ads/ads_bloc.dart';
import 'package:alnoormanment/BL/bloc/authentication/bloc.dart';
import 'package:alnoormanment/BL/bloc/price_currency/bloc.dart';
import 'package:alnoormanment/BL/bloc/splash/bloc.dart';
import 'package:alnoormanment/BL/bloc/users/users_bloc.dart';
import 'package:alnoormanment/DAL/repository/about_us/about_us_repository_imp.dart';
import 'package:alnoormanment/DAL/repository/ads/ads_repository_imp.dart';
import 'package:alnoormanment/DAL/repository/authentication/authentication_repository_impl.dart';
import 'package:alnoormanment/DAL/repository/price_currency/price_currency_repository_imp.dart';
import 'package:alnoormanment/DAL/repository/users/users_repository_imp.dart';
import 'package:alnoormanment/UI/ad/ad_new_screen.dart';
import 'package:alnoormanment/UI/ad/ads_screen.dart';
import 'package:alnoormanment/UI/Bottom_Bar.dart';
import 'package:alnoormanment/UI/currency/Calculater.dart';
import 'package:alnoormanment/UI/currency/add_currency_screen.dart';
import 'package:alnoormanment/UI/currency/currency.dart';
import 'package:alnoormanment/UI/users/adduser.dart';
import 'package:alnoormanment/UI/auth/login.dart';
import 'package:alnoormanment/UI/currency/managecurrency.dart';
import 'package:alnoormanment/UI/setting.dart';
import 'package:alnoormanment/UI/splash/splash_screen.dart';
import 'package:alnoormanment/UI/users/usersmanager.dart';
import 'package:alnoormanment/UI/we.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'app_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UsersBloc(repository: UserRepositoryImpl()),
          ),
          BlocProvider(
            create: (context) => AdsBloc(repository: AdsRepositoryImpl()),
          ),
          BlocProvider(
            create: (context) => AboutBloc(repository: AboutUsRepositoryImpl()),
          ),
          BlocProvider(
            create: (context) => SplashBloc(repository: AuthRepositoryImpl()),
          ),
          BlocProvider(
            create: (context) =>
                AuthenticationBloc(repository: AuthRepositoryImpl()),
          ),
          BlocProvider(
            create: (context) =>
                PriceCurrencyBloc(repository: PriceCurrencyRepositoryImpl()),
          ),
        ],
        child: MaterialApp(
            title: Config.title,
            debugShowCheckedModeBanner: Config.isDebug,
            theme: ThemeData(fontFamily: "NotoKufiArabic"),
            builder: EasyLoading.init(),
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              CurrencyScreen.routeName: (context) => CurrencyScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              "/Usersmanager": (context) => Usersmanager(),
              "/Calculator": (context) => Calculater(),
              "/We": (context) => We(),
              "/Setting": (context) => Setting(),
              ManageCurrencyScreen.routeName: (context) =>
                  ManageCurrencyScreen(),
              "/Addcurrency": (context) => AddCurrencyScreen(),
              AdsScreen.routeName: (context) => AdsScreen(),
            },
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case AddNewAdScreen.routeName:
                  UpdateAdScreenArguments args =
                      settings.arguments as UpdateAdScreenArguments;
                  return MaterialPageRoute(
                      builder: (context) => AddNewAdScreen(
                            args.ad,
                          ));
                case AddUserScreen.routeName:
                  UpdateUserScreenArguments args =
                      settings.arguments as UpdateUserScreenArguments;
                  return MaterialPageRoute(
                      builder: (context) => AddUserScreen(
                            user: args.user,
                          ));
                default:
                  return null;
              }
            }));
  }
}
