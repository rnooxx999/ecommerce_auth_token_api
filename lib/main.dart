import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_route/providers/AppCofigProvider.dart';
import 'package:shop_route/ui/home/home_screen.dart';
import 'package:shop_route/ui/login/login_screen.dart';
import 'package:shop_route/ui/register/register_screen.dart';
import 'package:shop_route/ui/splash/splash_screen.dart';
import 'package:shop_route/utilites/compenents.dart';
import 'package:shop_route/utilites/them_data.dart';

void main() {
  runApp( ChangeNotifierProvider<AppConfigProvider>(
      create: (_) => AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.shopThemData,
      routes: {
        routeNameSplashScreen : (context)=> SplashScreen(),
        routeNameRegisterScreen:(context)=> RegisterScreen(),
        routeNameLoginScreen :(context)=> LoginScreen(),
        routeNameHomeScreen :(context)=> HomeScreen(),
      },
      initialRoute: routeNameSplashScreen,
    );
  }
}
