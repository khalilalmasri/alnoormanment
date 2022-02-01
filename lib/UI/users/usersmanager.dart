import 'package:alnoormanment/BL/bloc/users/bloc.dart';
import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:alnoormanment/DAL/web_services/api_price_currency_constant.dart';
import 'package:alnoormanment/UI/shared/widget/error/no_internet_widget.dart';
import 'package:alnoormanment/UI/shared/widget/progress/progress.dart';
import 'package:alnoormanment/UI/shared/widget/user_list_tile_widget.dart';
import 'package:alnoormanment/UI/users/adduser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../shared/responsive/responsive.dart';
import '../shared/thems.dart';
import '../shared/widget/Floating_Action_B.widget.dart';
import '../shared/words.dart';

class Usersmanager extends StatefulWidget {
  Usersmanager({Key? key}) : super(key: key);

  @override
  _UsersmanagerState createState() => _UsersmanagerState();
}

class _UsersmanagerState extends State<Usersmanager> {
  bool usr = true;

  @override
  void initState() {
    context.read<UsersBloc>().add(LoadUsersData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
      if (state is UsersHasData) {
        if (state.hasSubmitUser) {
          EasyLoading.showSuccess("تم الإضافة بنجاح");
          state.hasSubmitUser = false;
        }
        if (state.hasUpdateUser) {
          EasyLoading.showSuccess("تم التعديل بنجاح");
          state.hasUpdateUser = false;
        }
        if (state.hasDeleteUser) {
          EasyLoading.showSuccess("تم الحذف بنجاح");
          state.hasDeleteUser = false;
        }
        return _getPageContent();
      } else if (state is UsersLoading) {
        return LoadingIndicator();
      } else if (state is UsersError) {
        return Stack(
          children: [
            _getPageContent(),
          ],
        );
      } else if (state is UsersNoInternetConnection) {
        return Stack(
          children: [
            _getPageContent(),
            NoInternetWidget(
              message: StringPlatform.no_internet,
              onPressed: () {
                context.read<UsersBloc>().add(LoadUsersData());
              },
            ),
          ],
        );
      } else {
        return Center(child: Text("Something get wrong"));
      }
    });
  }

  Widget _getPageContent() {
    List<Widget> users = [];

    ApiPriceCurrencyConstant.usersResponse.forEach((element) {
      users.add(UserListTileWidget(
        onChange: (val) {
          setState(() {
            element.isBlocked = !val;
            context.read<UsersBloc>().add(ToggleBlockUser(
                    userBlocked: User(
                  phoneNumber: '',
                  user_id: element.id,
                  name: '',
                  id: 0,
                  userName: '',
                  userRole: '',
                  email: '',
                )));
          });
        },
        user_name: element.userName,
        phone: element.phoneNumber,
        isBlocked: element.isBlocked,
        id: element.id,
        email: element.email,
        name: element.name,
        userRole: element.userRole,
      ));
    });
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPlatform.firstcolor,
            title: const Text(StringPlatform.users),
          ),
          floatingActionButton: FloatingActionBar(
            onPressed: () =>
                Navigator.pushNamed(context, AddUserScreen.routeName,
                    arguments: UpdateUserScreenArguments(User(
                      id: 0,
                      name: '',
                      image: '',
                      isBlocked: false,
                      phoneNumber: '',
                      email: '',
                      userName: '',
                      userRole: '',
                    ))),
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
                  child: ListView(children: users.map((e) => e).toList()),
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
