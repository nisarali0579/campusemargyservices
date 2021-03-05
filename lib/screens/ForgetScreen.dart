import 'package:campus_emargency_project_ui/screens/ResistScreen.dart';
import 'package:campus_emargency_project_ui/utils/utils.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  static String id = 'ForgetPassword';

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 50.0,),
          Center(child: Icon(Icons.lock)),
          SizedBox(height: 80.0,),
          Text("Forget Your",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.green),),
          Text("Password",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.green),),
          SizedBox(height: 50.0,),
          Utils.email_text('Email'),
          SizedBox(height: 10.0,),
         // Utils.button('type your email', (){}),
          Center(
            child: Utils.smallButton('Send', (){
              Navigator.pushNamed(context, ResitPassword.id);
            })
          )
        ],
      ),
    ));
  }
}
