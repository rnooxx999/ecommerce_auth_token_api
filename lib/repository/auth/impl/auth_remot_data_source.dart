


import 'package:shop_route/api/api_manager.dart';
import 'package:shop_route/api/model/response/LoginResponse.dart';
import 'package:shop_route/api/model/response/RegisterResponse.dart';
import 'package:shop_route/repository/auth/auth_repo_contract.dart';

class AuthRemoteDataSourcesImpl implements AuthRemoteDataSource{

  ApiManager apiManager;
  AuthRemoteDataSourcesImpl(this.apiManager);

  @override
  Future<LoginResponse> login(String email, String password) async{
    var response =await apiManager.signIn(email, password);
    return response;
  }

  @override
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) async{
    var response = await apiManager.register(name, email, phone, password, rePassword);
   print(response.token);
    return response;
  }

}