


import 'package:flutter/cupertino.dart';
import 'package:shop_route/base/base_v_m.dart';
import 'package:shop_route/providers/AppCofigProvider.dart';
import 'package:shop_route/repository/auth/auth_repo_contract.dart';
import 'package:shop_route/repository/auth/impl/auth_remot_data_source.dart';
import 'package:shop_route/repository/auth/impl/auth_repo_impl.dart';
import 'package:shop_route/ui/login/login_navigator.dart';

import '../../api/api_manager.dart';
import '../widgets/dialog_util.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  //LoginNavigator? navigator;
  //AuthRemoteDataSourcesImpl authRemoteDataSourcesImpl;
 // late AuthRemoteDataSource remoteDataSource;
 // late ApiManager apiManager;
   AppConfigProvider? appConfigProvider;
   AuthRepository repository;

  LoginViewModel(this.repository);
  // {
  //   apiManager = ApiManager();
  //   remoteDataSource = AuthRemoteDataSourcesImpl(apiManager);
  //   repository = AuthRepositoryImpl(remoteDataSource);
  // }


  void login(String email, String password) async{

    //الnavigator تم اخذه من BaseViewModel الذي يعرف انه يشير الى LoginNavigator

    navigator?.showProgressDialog('loading');
    //DialogUtil.showProgressDialog(context, 'loading');
    try {
      var token = await repository.login(
          email, password);
      navigator?.hideDialog();
     // DialogUtil.hideLoading(context);
      if (token == null){
        navigator?.showMessage(message: "Unable To LogIn Wrong username Or Password"
        ,posActionTitle: 'ok');

        return;
      }
        //appConfig.updateToken(response.token);
      navigator?.showMessage(
            message: 'successuful login' ,
            posActionTitle: 'ok',
          posAction: (){
              appConfigProvider?.updateToken(token);
            navigator?.goToHome();
          }
          ,isDismissible: false        );
    }
    catch(e){
      navigator?.hideDialog();
      navigator?.showMessage(
          message: "Error", posActionTitle: "ok");
    }
  }

}