import 'package:alnoormanment/BL/bloc/users/bloc.dart';
import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:alnoormanment/UI/shared/widget/error/error.dart';
import 'package:alnoormanment/UI/shared/widget/progress/progress.dart';
import 'package:alnoormanment/UI/shared/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/src/provider.dart';
import '../shared/responsive/responsive.dart';
import '../shared/thems.dart';
import '../shared/widget/Button.widget.dart';
import '../shared/widget/Logo.widget.dart';
import '../shared/words.dart';

class AddUserScreen extends StatefulWidget {
  static const String routeName = "/AddUser";
  final User user;

  AddUserScreen({Key? key, required this.user}) : super(key: key);

  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  late TextEditingController nameController;
  late TextEditingController userNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  late TextEditingController currentPasswordController;
  bool usr = true;
  var responsibility;

  @override
  void initState() {
    nameController = TextEditingController();
    userNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    currentPasswordController = TextEditingController();

    userNameController.text = widget.user.userName;
    nameController.text = widget.user.name;
    phoneController.text = widget.user.phoneNumber;
    emailController.text = widget.user.email;
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
            title:  Text(   widget.user.id == 0
                ?StringPlatform.Adduser:StringPlatform.Edituser+' '+ widget.user.name),
          ),
          body: BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
            if (state is UsersHasData) {
              return _getPageContent();
            } else if (state is UsersLoading) {
              return LoadingIndicator();
            } else if (state is UsersError) {
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
            } else if (state is UsersNoInternetConnection) {
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
      margin: EdgeInsets.all(15),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: Responsive.isMobile(context) ? 0 : 6, child: Container()),
          Expanded(
            flex: 18,
            child: ListView(children: [
              Logo_widget(),
              TextFormFieldWidget(
                controller: userNameController,
                Field_Name: StringPlatform.username,
                obscure_Text: false,
                Input_type: TextInputType.text,
              ),
              TextFormFieldWidget(
                controller: emailController,
                Field_Name: StringPlatform.mail,
                obscure_Text: false,
                Input_type: TextInputType.emailAddress,
              ),
              TextFormFieldWidget(
                controller: nameController,
                Field_Name: StringPlatform.name,
                obscure_Text: false,
                Input_type: TextInputType.text,
              ),
              TextFormFieldWidget(
                controller: phoneController,
                Field_Name: StringPlatform.phone,
                obscure_Text: false,
                Input_type: TextInputType.text,
              ),
              widget.user.id == 0
                  ? Container()
                  : Container(
                      child: TextFormFieldWidget(
                          controller: currentPasswordController,
                          Field_Name: StringPlatform.currentPassword,
                          obscure_Text: false,
                          Input_type: TextInputType.text),
                    ),
              Container(
                child: TextFormFieldWidget(
                    controller: passwordController,
                    Field_Name: StringPlatform.password,
                    obscure_Text: false,
                    Input_type: TextInputType.text),
              ),
              Container(
                child: TextFormFieldWidget(
                    controller: rePasswordController,
                    Field_Name: StringPlatform.passwordconfirmation,
                    obscure_Text: false,
                    Input_type: TextInputType.text),
              ),
              Row(
                children: [
                  // Container(
                  //   margin: EdgeInsets.all(10),
                  //   alignment: Alignment.centerRight,
                  //   decoration: DecoPlatform.decotapbar,
                  //   height: 40,
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton(
                  //       hint: Text(
                  //         StringPlatform.responsibility,
                  //         style: StylePlatform.hinttext,
                  //       ),
                  //       items: [
                  //         StringPlatform.director,
                  //         StringPlatform.assistantdirector
                  //       ]
                  //           .map((e) => DropdownMenuItem(
                  //                 child: Text("$e",
                  //                     style: StylePlatform.hinttext),
                  //                 value: e,
                  //               ))
                  //           .toList(),
                  //       onChanged: (val) {
                  //         setState(() {
                  //           responsibility = val;
                  //         });
                  //       },
                  //       value: responsibility,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              widget.user.id == 0
                  ? ButtonWidget(
                      Button_Name: StringPlatform.add,
                      Push_named: "",
                      onPressed: () {
                        context.read<UsersBloc>().add(AddUser(
                            newUser: User(
                              password: passwordController.text,
                              password_confirmation: rePasswordController.text,
                              old_password: currentPasswordController.text,
                              id: widget.user.id,
                              user_id: widget.user.id,
                              name: nameController.text,
                              phoneNumber: phoneController.text,
                              email: emailController.text,
                              userName: userNameController.text,
                              userRole: 'AD',
                              isBlocked: widget.user.isBlocked,
                            ),
                            context: context));
                      },
                    )
                  : ButtonWidget(
                      Button_Name: StringPlatform.edit,
                      Push_named: "",
                      onPressed: () {
                        context.read<UsersBloc>().add(UpdateUser(
                            user: User(
                              password: passwordController.text,
                              password_confirmation: rePasswordController.text,
                              old_password: currentPasswordController.text,
                              id: widget.user.id,
                              user_id: widget.user.id,
                              name: nameController.text,
                              phoneNumber: phoneController.text,
                              email: emailController.text,
                              userName: userNameController.text,
                              userRole: 'AD',
                              isBlocked: widget.user.isBlocked,
                            ),
                            context: context));
                      },
                    ),
            ]),
          ),
          Expanded(
              flex: Responsive.isMobile(context) ? 0 : 6, child: Container()),
        ],
      ),
    );
  }
}

class UpdateUserScreenArguments {
  final User user;

  UpdateUserScreenArguments(this.user);
}
