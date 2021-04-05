import 'package:flutter/material.dart';

import 'package:campus_emargency_project_ui/screens/login_home.dart';
import 'package:campus_emargency_project_ui/screens/user_login_screen.dart';
import 'package:campus_emargency_project_ui/screens/signup_screen.dart';
import 'package:campus_emargency_project_ui/screens/ForgetScreen.dart';
import 'package:campus_emargency_project_ui/screens/ResistScreen.dart';
import 'package:campus_emargency_project_ui/screens/admin_screen.dart';
import 'package:campus_emargency_project_ui/screens/user_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:campus_emargency_project_ui/screens/admin_login_screen.dart';
import 'package:campus_emargency_project_ui/screens/user_menu_screen.dart';
import 'package:campus_emargency_project_ui/screens/user_profile_screen.dart';
import 'package:campus_emargency_project_ui/screens/user_notification_screen.dart';
import 'package:campus_emargency_project_ui/screens/welcome_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: WelcomeScreen(),
      initialRoute: WellComeScreen.id,
      routes: {
        WellComeScreen.id: (context) => WellComeScreen(),
        loginHome.id: (context) => loginHome(),
        UserLoginScreen.id: (context) => UserLoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        ForgetPassword.id: (context) => ForgetPassword(),
        ResitPassword.id: (context) => ResitPassword(),
        adminScreen.id: (context) => adminScreen(),
        userScreen.id: (context) => userScreen(),
        AdminLoginScreen.id:(context)=>AdminLoginScreen(),
        UserMenuScreen.id:(context)=>UserMenuScreen(),
        userProfileScreen.id:(context)=>userProfileScreen(),
        userNotificationScreen.id:(context)=>userNotificationScreen(),

      },
    );
  }
}

// color: Color(0xffD0874C),
// Navigator.pushNamed(context, ForgetPassword.id);
// backgroundColor: Color(0XFFF7F7F7),
