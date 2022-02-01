import 'package:alnoormanment/BL/bloc/authentication/bloc.dart';
import 'package:alnoormanment/UI/shared/responsive/responsive.dart';
import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:alnoormanment/UI/shared/widget/Button.widget.dart';
import 'package:alnoormanment/UI/shared/widget/error/error.dart';
import 'package:alnoormanment/UI/shared/widget/progress/progress.dart';
import 'package:alnoormanment/UI/shared/widget/text_form_field_widget.dart';
import 'package:alnoormanment/UI/shared/words.dart';
import 'package:alnoormanment/UI/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // bool _isChecked = false;
  late TextEditingController passwordController;

  late TextEditingController userNameController;

  @override
  void initState() {
    context.read<AuthenticationBloc>().add(LoadLoginPage());
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationNotAuthenticated) {
        return _getPageContent();
      } else if (state is AuthenticationLoading) {
        return LoadingIndicator();
      } else if (state is UserRoleNotAccepted) {
        return NoAcceptedUserRoleWidgetWidget(
            message: state.errorMessage, routeName: SplashScreen.routeName);
      } else if (state is AuthenticationError) {
        // EasyLoading.showError(state.errorMessage);
       EasyLoading.showError(' خطأ في اسم المستخدم او كلمة السر');
        return Stack(
          children: [
            _getPageContent(),
          ],
        );
      } else if (state is AuthenticationNoInternetConnection) {
        return Stack(
          children: [
            _getPageContent(),
            NoInternetWidget(
              message: StringPlatform.no_internet,
              onPressed: () {
                context.read<AuthenticationBloc>().add(LoadLoginPage());
              },
            ),
          ],
        );
      } else {
        return Center(child: Text("Something get wrong"));
      }
    }));
  }

  Widget _getPageContent() {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(color: ColorPlatform.firstcolor),
          child: Row(
            children: [
              Expanded(
                  flex: Responsive.isMobile(context) ? 0 : 6,
                  child: Container()),
              Expanded(
                flex: 18,
                child: ListView(
                  children: [
                    Container(
                      height: 250,
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      width: double.infinity,
                      child: Image(image: AssetImage("images/logo.png")),
                    ),
                    const Center(
                        child: Text(
                      StringPlatform.forexchange,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ColorPlatform.colorwhite),
                    )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Form(
                          child: Column(
                        children: [
                          TextFormFieldWidget(
                            controller: userNameController,
                            Field_Name: "User Name",
                            obscure_Text: false,
                            Input_type: TextInputType.text,
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: TextFormFieldWidget(
                                controller: passwordController,
                                Field_Name: "Password",
                                obscure_Text: true,
                                Input_type: TextInputType.text,
                              )),
                        ],
                      )),
                    ),
                    Row(
                      children: [
                        Expanded(flex: 2, child: Container()),
                        Expanded(
                          flex: 3,
                          child: Container(
                              height: 60,
                              width: double.infinity,
                              child: ButtonWidget(
                                onPressed: () {
                                  (userNameController.text.isNotEmpty &&
                                          passwordController.text.isNotEmpty)
                                      ? context.read<AuthenticationBloc>().add(
                                          SubmitEmailFormLogin(
                                              userName: userNameController.text,
                                              password: passwordController.text,
                                              context: context))
                                      : null;
                                  // Navigator.of(context).pushNamed('BottomBar');
                                },
                                Button_Name: StringPlatform.login,
                                Push_named: "",
                              )),
                        ),
                        Expanded(flex: 2, child: Container()),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: Responsive.isMobile(context) ? 0 : 6,
                  child: Container()),
            ],
          ),
        ));
  }
}
