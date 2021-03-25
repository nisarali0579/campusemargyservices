import 'package:flutter/material.dart';
import 'package:safraan/home_tariq.dart';
import 'package:safraan/view_Catagary.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cosntants_file.dart';
import 'loginScreen.dart';
import 'package:http/http.dart' as http;
import 'package:regexed_validator/regexed_validator.dart';
import 'dart:io';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String firstNameError = null;
  String emailError = null;
  String passwordError = null;
  bool isFirstNameValid = true;
  bool isLastNameValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;

  void displayError() {
    firstNameError =
    firstNameController.text.isEmpty ? "First Name Must not be empty" : null;
    emailError =
    emailController.text.isEmpty ? "Email Must not be empty" : null;
    passwordError =
    passwordController.text.isEmpty ? "Password Must not be empty" : null;
    updateState();
  }

  void checkValidation()
  {
    isFirstNameValid =checkNameValidation(firstNameController.text) ;//validator.name(firstNameController.text);
    isLastNameValid = validator.name(lastNameController.text);
    isEmailValid =    validator.email(emailController.text);
    isPasswordValid =  passwordController.text.length >= 6 ? true:false ;
  }

  bool checkNameValidation(String name){
    Pattern pattern = r'^(?:[A-Za-z_ \-]+)*$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(name);
  }
  void updateState() {setState(() {});
  }

  @override
  void dispose()
  {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: Colors.grey,
          cursorColor: Colors.black
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: AppBar(
              backgroundColor: Colors.orange
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width:MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height -MediaQuery.of(context).padding.bottom - MediaQuery.of(context).padding.top-30,
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: SizedBox()
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image(
                        image: AssetImage('assets/saffron-logo.png')
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                      'All natural yet So Magical.../',
                      style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Expanded(
                        child: Align(

                          alignment: Alignment.bottomCenter,
                          child: TextField(
                            controller: firstNameController,
                            textAlign: TextAlign.center,
                            decoration: kDecoration.copyWith(
                                labelText: firstNameError,
                                hintText:firstNameError == null?'First Name':null,
                                prefixIcon: Icon(Icons.person)
                            ),
                            onChanged: (value){
                              firstNameError = firstNameController.text.isEmpty ? "First Name Must not be empty":null;
                              updateState();
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: lastNameController,
                          textAlign: TextAlign.center,
                          decoration: kDecoration.copyWith(
                              hintText: 'Last Name',
                              prefixIcon: Icon(Icons.person)
                          ),
                          onChanged: (value)
                          {},
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: emailController,
                          textAlign: TextAlign.center,
                          decoration:kDecoration.copyWith(
                              labelText: emailError,
                              hintText:emailError == null? 'Email':null,
                              prefixIcon: Icon(Icons.email_outlined)
                          ),
                          onChanged: (value)
                          {
                            emailError = emailController.text.isEmpty ? "Email Must not be empty":null;
                            updateState();
                          },
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: passwordController,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          decoration: kDecoration.copyWith(
                              labelText: passwordError,
                              hintText:passwordError == null?'Password':null,
                              prefixIcon: Icon(Icons.lock)
                          ),
                          onChanged: (value)
                          {
                            passwordError = passwordController.text.isEmpty ? "Password Must not be empty":null;
                            updateState();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1,
                  child: SizedBox(),),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Builder(
                      builder:(BuildContext context)=> MaterialButton(
                          child: Container(
                            width: double.maxFinite,
                            height: 20,
                            child: Center(
                              child: Text(
                                  'Register',
                                  style: kbuttonTextStyle
                              ),
                            ),
                          ),
                          color: Colors.orange,
                          onPressed: ()async{
                            if(firstNameController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                              {
                                try {
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Container(
                                        height: 50,
                                        width: 50,
                                        child: Center(child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                                        ),
                                        ),
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                  );
                                  final result = await InternetAddress.lookup('google.com');
                                  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                                    postRequest();
                                  }
                                } on SocketException catch (_) {
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Lost Internet Connection',
                                        textAlign: TextAlign.center,
                                        style: kTextButtonStyle,
                                      ),
                                      backgroundColor: Colors.grey,
                                    ),
                                  );
                                }
                              }
                            } else
                              displayError();
                          }
                      ),
                    ),
                  ),

                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account?',
                        style: TextStyle(
                            color: Colors.black
                        ),
                      ),
                      MaterialButton(
                          child: Text(
                              'Login',
                              style: kbuttonTextStyle
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context)=>LoginScreen()));

                          }
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          width: double.maxFinite,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                          'OR',
                          style: kTextButtonStyle
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          width: double.maxFinite,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    'Sign in with Social Accounts',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                            child: Image(
                              width: 60,
                              height: 40,
                              image: AssetImage(
                                'assets/facebook.jpeg',
                              ),
                            ),
                            onPressed: (){}
                        ),
                        MaterialButton(
                            child: Image(
                              width: 60,
                              height: 40,
                              image: AssetImage(
                                'assets/instagram.jpg',
                              ),
                            ),
                            onPressed: (){}
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  postRequest ()async
  {
    checkValidation();
    if(isFirstNameValid && isPasswordValid && isEmailValid)
    {
      Map <String,String> body =
      {
        'fname':firstNameController.text,
        'lname':lastNameController.text,
        'email':emailController.text,
        'password': passwordController.text
      };

      Map <String,String> header = {'mobile':'1'};

      var response = await http.post(
          'https://saffron.lastmic.com/public/api/register',
          body: body,
          headers: header
      );

      if(response.statusCode == 200)
        if(response.body== 'Email Already Exist...!') {
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(

                  content: Text('This Email Already Exist'),
                );
              }
          );
        }
        else
        {
          loginUser = await SharedPreferences.getInstance();
          loginUser.setString('email', '${emailController.text}');
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>HomePage_Tariq()), (route) => false);
          // Navigator.of(context)
          //     .pushNamedAndRemoveUntil('HomePage_Tariq()', (Route<dynamic> route) => false);
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (BuildContext context)=>HomePage_Tariq())
          // );
        }

      else
        defaultCircularBar();
      //print("Error internet =${response.body}");
    }
    else
    {
      firstNameError = isFirstNameValid ? null:'Invalid Name';
      passwordError  = isPasswordValid ? null:'Password not be less 6 character';
      emailError     = isEmailValid ? null:'Invalid Email';
      updateState();
    }
  }
}