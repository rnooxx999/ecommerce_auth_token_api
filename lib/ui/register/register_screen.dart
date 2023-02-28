

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_route/api/api_manager.dart';
import 'package:shop_route/base/base_navigators.dart';
import 'package:shop_route/base/base_state.dart';
import 'package:shop_route/ui/register/register_navigator.dart';
import 'package:shop_route/ui/register/register_vm.dart';
import 'package:shop_route/ui/widgets/button_submit_wodget.dart';
import 'package:shop_route/ui/widgets/dialog_util.dart';
import 'package:shop_route/ui/widgets/form_field_customer.dart';

import '../../providers/AppCofigProvider.dart';
import '../../utilites/compenents.dart';
import '../di.dart';
import '../login/login_vm.dart';

class RegisterScreen extends StatefulWidget{

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState<RegisterScreen,RegisterViewModel> implements RegisterNavigator {

  @override
  RegisterViewModel initViewModel() {
    //var configProv =viewModel.appConfigProvider = Provider.of<AppConfigProvider>(context,listen: false);
    return RegisterViewModel(injectAuthRepositry());
  }

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();


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
                    FormFieldCustomer(label: "First Name",
                      hint: "enter first name",
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text
                            .trim()
                            .isEmpty) {
                          return "please Enter your name";
                        }
                      },
                    ),
                    FormFieldCustomer(label: "Email",
                      hint: "enter Email",
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text
                            .trim()
                            .isEmpty) {
                          return "please Enter your email";
                        }
                        //TODO email Format
                      },
                    ),
                    FormFieldCustomer(label: "Phone Number",
                      hint: "enter Phone Number",
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      validator: (text) {
                        if (text == null || text
                            .trim()
                            .isEmpty) {
                          return "please Enter phone number";
                        }
                        //TODO if number is validate and correct
                      },
                    ),
                    FormFieldCustomer(label: "Password",
                      hint: "enter Password",
                      hideText: true,
                      controller: passwordController,

                      validator: (text) {
                        if (text == null || text
                            .trim()
                            .isEmpty) {
                          return "please Enter your password";
                        }
                      },
                    ),
                    FormFieldCustomer(label: "Password Confirmation",
                      hint: "enter Password Confirmation"
                      ,
                      hideText: true,
                      controller: confirmPasswordController,
                      validator: (text) {
                        if (text == null || text
                            .trim()
                            .isEmpty) {
                          return "please Enter your password again";
                        }
                        if (passwordController.text != text) {
                          return "password dosn't match";
                        }
                      },
                    ),
                    SizedBox(height: 10,),

                    ButtonSubmitWidget(
                      onPressed: register,
                      text: 'sign up',),
                  ],),
              ),
            ),
          ),
        ));
  }

  void register() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    viewModel.SignUp(name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        rePassword: confirmPasswordController.text,
        phone: phoneController.text);
  }



  @override
  void goToHome() {
    Navigator.pushReplacementNamed(context, routeNameHomeScreen);
  }
}