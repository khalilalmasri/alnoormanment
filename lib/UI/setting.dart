import 'package:alnoormanment/BL/bloc/authentication/auth_bloc.dart';
import 'package:alnoormanment/BL/bloc/authentication/auth_event.dart';
import 'package:alnoormanment/UI/currency/currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'shared/responsive/responsive.dart';
import 'shared/thems.dart';
import 'shared/widget/Logo.widget.dart';
import 'shared/words.dart';

class Setting extends StatefulWidget {
  Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorPlatform.firstcolor,
              title: const Text(StringPlatform.companyname),
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
                      // Container(
                      //   margin: EdgeInsets.all(10),
                      //   height: 60,
                      //   decoration: DecoPlatform.decofirstwide,
                      //   alignment: Alignment.center,
                      //   child: ListTile(
                      //     title: Text(StringPlatform.currencymanag),
                      //     leading: Icon(Icons.monetization_on),
                      //     onTap: () {
                      //       Navigator.of(context)
                      //           .pushNamed(CurrencyScreen.routeName);
                      //     },
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.all(10),
                      //   height: 60,
                      //   decoration: DecoPlatform.decofirstwide,
                      //   alignment: Alignment.center,
                      //   child: ListTile(
                      //     title: Text(StringPlatform.calculator),
                      //     leading: Icon(Icons.calculate),
                      //     onTap: () {
                      //       Navigator.of(context).pushNamed("/Calculator");
                      //     },
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 60,
                        decoration: DecoPlatform.decofirstwide,
                        alignment: Alignment.center,
                        child: ListTile(
                          title:const Text(StringPlatform.advertismanage),
                          leading:const Icon(Icons.monitor),
                          onTap: () {
                            Navigator.of(context).pushNamed("/Advmanager");
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 60,
                        decoration: DecoPlatform.decofirstwide,
                        alignment: Alignment.center,
                        child: ListTile(
                          title:const Text(StringPlatform.we),
                          leading:const Icon(Icons.business),
                          onTap: () {
                            Navigator.of(context).pushNamed("/We");
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 60,
                        decoration: DecoPlatform.decofirstwide,
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text(StringPlatform.users),
                          leading: Icon(Icons.manage_accounts_sharp),
                          onTap: () {
                            Navigator.of(context).pushNamed("/Usersmanager");
                          },
                        ),
                      ),
                      Container(
                        margin:const EdgeInsets.all(10),
                        height: 60,
                        decoration: DecoPlatform.decofirstwide,
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text(StringPlatform.logout),
                          leading: Icon(Icons.logout_outlined),
                          onTap: () {
                            context
                                .read<AuthenticationBloc>()
                                .add(LogoutEvent());
                             Navigator.of(context).pushNamed("/login");
                          },
                        ),
                      )
                    ]),
                  ),
                  Expanded(
                      flex: Responsive.isMobile(context) ? 0 : 6,
                      child: Container()),
                ],
              ),
            )));
  }
}
