import 'package:check_project/utili/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton=false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.white,
      child:SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/login.png",fit:BoxFit.cover),
            SizedBox(height: 20.0,
            ),
            Text("Welcome $name",
            style:TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,

            ),
     textScaleFactor: 1.0,
    ),

            SizedBox(height: 20.0,
            ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Column(
           children: <Widget>[
             TextFormField(
               decoration: InputDecoration(hintText: "Enter UserName", labelText: "UserName",),
               onChanged:(value){
                 name=value;
                 setState(() {

                 });
               } ,
             ),
             TextFormField(
               obscureText: true,
               decoration: InputDecoration(hintText: "Enter Password", labelText: "Password",),
             ),
             SizedBox(
               height:20,
             ),
             InkWell(
               onTap:() async{

                 setState(() {
                   changeButton=true;
                 });
                 await Future.delayed(Duration(seconds:1));
                 Navigator.pushNamed(context, MyRoutes.homeRoute);
             },
               child: AnimatedContainer(
                 duration: Duration(seconds: 1),
                   width: changeButton? 50:150,
                   height:50,

                      alignment: Alignment.center,
                      child: changeButton?Icon(Icons.done,color: Colors.white): Text('Login',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20,
                   fontWeight:FontWeight.bold,
                 ),
               ),
                 decoration:BoxDecoration(color:Colors.deepPurple,
                     borderRadius: BorderRadius.circular(changeButton? 50:8)) ,
                    ),
             ),
                  // ElevatedButton(child: Text("LogIn"),
             // style: TextButton.styleFrom(minimumSize:Size(150,50) ),
             //   onPressed:() {

             //   },
             // ),
           ],

     ),
        ),


          ],
        ),
      ),
    );
  }
}
