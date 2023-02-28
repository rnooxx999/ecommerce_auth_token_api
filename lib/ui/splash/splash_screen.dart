

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_route/utilites/compenents.dart';

class SplashScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),(){
        Navigator.pushReplacementNamed(context, routeNameLoginScreen);
    }
    );
    return Scaffold(
      body: Image.asset("assets/images/splash_screen.png",
        height: double.infinity,width: double.infinity,
      ),
    );
  }
}
