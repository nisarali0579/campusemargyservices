import 'package:flutter/material.dart';
import 'package:campus_emargency_project_ui/utils/utils.dart';
import 'package:campus_emargency_project_ui/screens/user_login_screen.dart';

class ResitPassword extends StatefulWidget {
  static String id = 'ResitPassword';
  @override
  _ResitPasswordState createState() => _ResitPasswordState();
}

class _ResitPasswordState extends State<ResitPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50.0,),
          Center(child: Icon(Icons.lock)),
          SizedBox(height: 80.0,),
          Text("Resit Your",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.green),),
          Text("Password",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.green),),
          SizedBox(height: 50.0,),
          Utils.email_text('Password'),
          Utils.email_text('Re-type-Password'),
          SizedBox(height: 10.0,),
          // Utils.button('type your email', (){}),
          Center(
            child: Utils.smallButton('Done',(){
              Navigator.pushNamed(context, UserLoginScreen.id);
            }),
          )

        ],
      ),
    ));
  }


}
