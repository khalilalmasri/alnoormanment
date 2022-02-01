import 'package:alnoormanment/UI/luncher/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'BL/bloc/app_bloc_observer.dart';


import 'UI/luncher/main_app.dart';


main() {
  Bloc.observer = AppBlocObserver();
  Config.appFlavor = Flavor.DEVELOPMENT;

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}


var currency;
