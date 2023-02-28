import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_route/api/api_manager.dart';
import 'package:shop_route/base/base_state.dart';
import 'package:shop_route/providers/AppCofigProvider.dart';
import 'package:shop_route/ui/di.dart';
import 'package:shop_route/ui/widgets/button_submit_wodget.dart';
import 'package:shop_route/ui/widgets/dialog_util.dart';
import 'package:shop_route/ui/widgets/form_field_customer.dart';

import '../../utilites/compenents.dart';
import 'login_navigator.dart';
import 'login_vm.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//
class _LoginScreenState extends BaseState<LoginScreen,LoginViewModel> implements LoginNavigator {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  // نستخدم اوبجكت ونضيفه في البروفايدر كرييت لاعادة استخدامه بكامل الstate بدل ان يكون خصرا على ال build
  //LoginViewModel loginViewModel = LoginViewModel();

  var formKey = GlobalKey<FormState>();

  //فنكشن عملتها في الbaseState تقوم بالاشارة الى كلاس الLoginViewModel كاوبجكت قمنا بتنفيذه هناك ونستخدمه كviewModel
  @override
  LoginViewModel initViewModel() {
   // var configProv = viewModel.appConfigProvider = Provider.of<AppConfigProvider>(context,listen: false);

    return LoginViewModel(injectAuthRepositry());
  }

  @override
  void initState() {
    //set for navigator
    //viewModel.appConfigProvider = Provider.of<AppConfigProvider>(context,listen: false);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.appConfigProvider = null;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("assets/images/logo.png"),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Please Sign In",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  FormFieldCustomer(
                    label: "Email",
                    hint: "enter Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please Enter your email";
                      }
                      //TODO email Format
                    },
                  ),
                  FormFieldCustomer(
                    label: "Password",
                    hint: "enter Password",
                    hideText: true,
                    controller: passwordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please Enter your password";
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Forget Password ?",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonSubmitWidget(
                    onPressed: login,
                    text: 'login',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, routeNameRegisterScreen);
                    },
                    child: Text(
                      "Dont have an account ? Create an account",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    var prov = Provider.of<AppConfigProvider>(context, listen: false);

    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.login(
      emailController.text,passwordController.text
    );
  }


  @override
  void goToHome() {
    Navigator.pushReplacementNamed(context, routeNameHomeScreen);
  }
}
