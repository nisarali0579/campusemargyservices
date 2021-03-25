
import 'package:flutter/material.dart';
import 'package:campus_emargency_project_ui/utils/utils.dart';
import 'user_login_screen.dart';
import 'admin_login_screen.dart';

class loginHome extends StatefulWidget {
  static String id = 'welcomeScreen';
  @override
  _loginHomeState createState() => _loginHomeState();
}
// Utils utils = Utils();
class _loginHomeState extends State<loginHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 17.0,
          ),
          Flexible(
            child: Container(
              //  padding: EdgeInsets.only(top: 17.0, left: 137, right: 154, bottom: 775),
              child: Image.asset(
                'images/logo.png',
                height: 134,
                width: 137,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Utils.welcome_text("LOGIN"),
          ),
          SizedBox(
            height: 150.0,
          ),
          Utils.largeLoginButton('user login', () {
            Navigator.pushNamed(context,  UserLoginScreen.id);
          }),
          SizedBox(
            height: 37.0,
          ),
          Utils.largeLoginButton('admin login', () {
            Navigator.pushNamed(context,  AdminLoginScreen.id);
          }),
        ],
      ),
    ),
    );
  }
}

