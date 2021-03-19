import 'package:campus_emargency_project_ui/screens/ForgetScreen.dart';
import 'package:flutter/material.dart';
import 'package:campus_emargency_project_ui/utils/utils.dart';
import 'package:campus_emargency_project_ui/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class UserLoginScreen extends StatefulWidget {
  static String id = 'UserLoginScreen';

  @override
  _UserLoginScreenState createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  //final String email =TextEditingController();
  bool _passwordVisibleOne = false;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String showEmailError = null;
  String passwordEmailError = null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
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
                height: 50.0,
              ),
              Center(
                child: Utils.welcome_text("USER LOGIN"),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                  child: Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                      hintText: "email",
                      errorText: showEmailError,
                      hintStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
              )),
              // Utils.email_text("Email",email),
              SizedBox(
                height: 1.0,
              ),
              Container(
                  child: Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: "Password",
                    errorText:passwordEmailError ,
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
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ForgetPassword.id);
                  },
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              // if (email != null && password != null)
              Utils.largeLoginButton(
                'Login',
                () async {
                  if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
                    try {
                      setState(() {
                        showSpinner = true;
                      });
                      final user = await _auth.signInWithEmailAndPassword(
                          email: _email.text, password: _password.text);
                      if (user != null) {
                        if (_email != null && _password != null) {
                          setState(() {
                            showSpinner = true;
                          });
                          Navigator.pushNamed(context, userScreen.id);
                        } else {
                          setState(() {
                            showSpinner = false;
                          });
                        }
                      }
                    } catch (e) {
                      print(e);
                    }
                  } else {
                    setState(() {
                      showEmailError = "Email not be empty";
                    });
                    setState(() {
                      passwordEmailError = "Password not be empty";
                    });
                  }
                },
              ),
              SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 100.0),
                child: Row(
                  children: [
                    Text(
                      'New to Spotify?',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                      child: Text(
                        ' Register',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

// Utils.largeLoginButton('Login', () async {
// try {
// setState(() {
// showSpinner=true;
// });
// final user = await _auth.signInWithEmailAndPassword(
// email: email, password: password);
// if (user != null) {
// setState(() {
// showSpinner=false;
// });
// Navigator.pushNamed(context, userScreen.id);
// }
// } catch (e) {
// print(e);
// }
// },
// ),
