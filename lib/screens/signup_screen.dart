import 'package:campus_emargency_project_ui/screens/login_home.dart';
import 'package:flutter/material.dart';
import 'package:campus_emargency_project_ui/utils/utils.dart';
import 'package:campus_emargency_project_ui/screens/user_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_home.dart';
class SignUpScreen extends StatefulWidget {
  static String id = "SignUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  bool _passwordVisibleOne = false;
  String email;
  String password;
  String name;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 17.0,
            ),
            Container(
              //  padding: EdgeInsets.only(top: 17.0, left: 137, right: 154, bottom: 775),
              child: Image.asset(
                'images/logo.png',
                height: 134,
                width: 137,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Utils.welcome_text("LOGIN"),
            ),
            SizedBox(
              height: 30.0,
            ),
            //Enter Name Email Passaword
            Container(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    onChanged: (value){
                      name = value;
                    },
                    decoration: InputDecoration(
                        hintText: 'User Name',
                        hintStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ),
                )),
            Container(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    onChanged: (value){
                      email = value;
                    },
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ),
                )),
            Container(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    onChanged: (value){
                      password=value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      // suffix: Icon(Icons.visibility_off),

                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisibleOne
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.pinkAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisibleOne = !_passwordVisibleOne;
                          });
                        },
                      ),
                    ),
                    obscureText: _passwordVisibleOne,
                  ),
                )),

            SizedBox(
              height: 60.0,
            ),
            Utils.largeButton('Login', () async {
              try {
                // setState(() {
                //   showSpinner=true;
                // });
                final user = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (user != null) {
                  // setState(() {
                  //   showSpinner=false;
                  // });
                  Navigator.pushNamed(context, LoginScreen.id);
                }
              } catch (e) {
                print(e);
              }
            },),
            SizedBox(
              height: 10.0,
            ),
            Utils.largeButton("GO BACK", () {
              Navigator.pushNamed(context, WelcomeScreen.id);
            })
          ],
        ),
      ),
    );
  }
}
