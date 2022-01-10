import 'package:alnoormanment/shared/responsive/responsive.dart';
import 'package:alnoormanment/shared/thems.dart';
import 'package:alnoormanment/shared/words.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      Container(
                        height: 90,
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        width: double.infinity,
                        child: Image(image: AssetImage("images/logo.png")),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 60,
                        decoration: DecoPlatform.decofirstwide,
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text(StringPlatform.currencymanag),
                          leading: Icon(Icons.monetization_on),
                          onTap: () {
                            Navigator.of(context).pushNamed("Currency");
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 60,
                        decoration:DecoPlatform.decofirstwide,
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text(StringPlatform.calculator),
                          leading: Icon(Icons.calculate),
                          onTap: () {
                            Navigator.of(context).pushNamed("Calculator");
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 60,
                        decoration: DecoPlatform.decofirstwide,
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text(StringPlatform.advertismanage),
                          leading: Icon(Icons.monitor),
                          onTap: () {
                            Navigator.of(context).pushNamed("signup");
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 60,
                        decoration: DecoPlatform.decofirstwide,
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text(StringPlatform.we),
                          leading: Icon(Icons.business),
                          onTap: () {
                            Navigator.of(context).pushNamed("We");
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
                            Navigator.of(context).pushNamed("Usersmanager");
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 60,
                        decoration: DecoPlatform.decofirstwide,
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text(StringPlatform.logout),
                          leading: Icon(Icons.logout_outlined),
                          onTap: () {
                            Navigator.of(context).pushNamed("signup");
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
