

import 'dart:convert';

import 'package:shop_route/api/model/request/LoginRequest.dart';
import 'package:shop_route/api/model/response/LoginResponse.dart';
import 'package:shop_route/api/model/response/RegisterResponse.dart';

import 'model/request/Register.dart';
import 'package:http/http.dart' as http;

class ApiManager{

  Future<RegisterResponse> register(String name ,String email ,String phone ,String password ,String rePassword)async{
    var requestBody = RegisterRequest(
      name: name , email: email ,password: password,
        phone: phone, repassword: rePassword
    );
    var url = Uri.https(ApiContent.basedUrl, ApiContent.register);
    var response = await http.post(url, body: requestBody.toJson());
    var result = RegisterResponse.fromJson(jsonDecode(response.body));
    print("kljjl ${result.token}");
    return result;
  }




  Future<LoginResponse> signIn(String email, String password  )async{
   var requestBody = LoginRequest(
       email: email ,password: password,
   );
   var url = Uri.https(ApiContent.basedUrl, ApiContent.login);
   var response = await http.post(url, body: requestBody.toJson());
   var result = LoginResponse.fromJson(jsonDecode(response.body));
   return result;
 }

}

class ApiContent{
  static String basedUrl = "route-ecommerce.vercel.app";
  static String register = "api/v1/auth/signup";
  static String login = "api/v1/auth/signin";


}