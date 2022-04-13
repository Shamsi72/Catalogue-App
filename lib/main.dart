import 'package:check_project/login_page.dart';
import 'package:check_project/utili/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      theme: ThemeData(primarySwatch: Colors.deepPurple,
          fontFamily:GoogleFonts.aBeeZee().fontFamily,
      ),

      // darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        '/': (context)=> HomePage(),
       MyRoutes.homeRoute:(context)=> HomePage(),
       MyRoutes.loginRoute:(context)=>  LoginPage(),
      },

    );
  }
}
