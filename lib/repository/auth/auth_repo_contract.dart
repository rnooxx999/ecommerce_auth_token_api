
//Interfaces :

import 'package:shop_route/api/model/response/LoginResponse.dart';
import 'package:shop_route/api/model/response/RegisterResponse.dart';

abstract class AuthRepository{

  Future<String?> login(String email , String password);
  Future<String?> register(String name,String email,String phone , String password,
      String rePassword 
      );

}

abstract class AuthRemoteDataSource{
  Future<LoginResponse> login(String email , String password);
  Future<RegisterResponse> register(String name,String email ,String phone, String password,
      String rePassword
      );
}