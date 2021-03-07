import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:campus_emargency_project_ui/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'admin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:campus_emargency_project_ui/services/user_management_screen.dart';

// Future<bool> authenticateUser(User user) async {
//   QuerySnapshot querySnapshot = await _firestore.collection("users").where("email", isEqualTo: user.email).get();
//   final List<DocumentSnapshot> docs = querySnapshot.docs;
//   return docs.length == 0 ? true : false;
// }
FirebaseFirestore _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class AdminLoginScreen extends StatefulWidget {
  static String id = 'AdminLoginScreen';

  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  bool _passwordVisibleOne = false;
  String email;
  String password;
  bool showSpinner = false;
  //User user;

  


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
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
                child: Utils.welcome_text("ADMIN LOGIN"),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                  child: Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      hintText: "email",
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
                  onChanged: (value) {
                    password = value;
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
                height: 50.0,
              ),

// Utils.largeLoginButton("Login", (){
//   UserManagement().authorizeAccess;
// })

              Utils.largeLoginButton("Login", (){

                _firestore.collection('admin').doc().get();

                if(email != null && password != null){
                      () async {
                    try {
                      // setState(() {
                      //   showSpinner=true;
                      // });

                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        // setState(() {
                        //   showSpinner=false;
                        // });
                        Navigator.pushNamed(context, adminScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                  };
                }else{

                }

              }
              ),

              SizedBox(
                height: 90.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Future<bool> authenticateUser(User user) async {
//   QuerySnapshot querySnapshot = await _firestore.collection("users").where("email", isEqualTo: user.email).get();
//   final List<DocumentSnapshot> docs = querySnapshot.docs;
//   return docs.length == 0 ? true : false;
// }
