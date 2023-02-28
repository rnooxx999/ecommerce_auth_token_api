


import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String? token;
  //UserDto userDto;


  void updateToken(String? newToken){
    this.token = newToken;
  }

}