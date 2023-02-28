


import 'package:flutter/cupertino.dart';
import 'package:shop_route/base/base_v_m.dart';
import 'package:shop_route/repository/auth/impl/auth_remot_data_source.dart';
import 'package:shop_route/repository/auth/impl/auth_repo_impl.dart';
import 'package:shop_route/ui/register/register_navigator.dart';
import '../../api/api_manager.dart';
import '../../providers/AppCofigProvider.dart';
import '../../repository/auth/auth_repo_contract.dart';

class RegisterViewModel extends BaseViewModel<RegisterNavigator> {
  AppConfigProvider? appConfigProvider;

  late AuthRepository repository;

  //injection From DIO
  RegisterViewModel(this.repository );

  void SignUp({required String name,required String email,required String password ,
    required String rePassword, required String phone }
      ) async{
    //الnavigator تم اخذه من BaseViewModel الذي يعرف انه يشير الى RegisterNavigator
    navigator?.showProgressDialog('loading');
    try {
      var token = await repository.register(
          name, email, phone,
          password, rePassword);
      navigator?.hideDialog();
      if (token == null){
        navigator?.showMessage(message: "Unable To Register",
          posActionTitle: 'ok',);
        return;
      }
      navigator?.showMessage(
            message:  "Sucssessful Rigistration",
          posActionTitle: 'ok',
          posAction: (){
            appConfigProvider?.updateToken(token);
            navigator?.goToHome();
          }
          ,isDismissible: false
            //negAction: (){Navigator.pushReplacementNamed(context, routeNameHomeScreen);}
        );
    }
    catch(e){
      navigator?.hideDialog();
      navigator?.showMessage(
          message: "Error", posActionTitle: "ok");
    }
  }

}