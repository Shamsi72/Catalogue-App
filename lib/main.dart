import 'package:check_project/cart_page.dart';
import 'package:check_project/login_page.dart';
import 'package:check_project/theme.dart';
import 'package:check_project/utili/routes.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme:MyTheme.lightTheme(context),
     darkTheme: MyTheme.darkTheme(context),

      // darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        '/': (context)=> HomePage(),
       MyRoutes.homeRoute:(context)=> HomePage(),
       MyRoutes.loginRoute:(context)=>  LoginPage(),
        MyRoutes.cartRoute:(context)=>  cartPage(),
      },

    );
  }
}
