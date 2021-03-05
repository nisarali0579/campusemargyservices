import 'package:flutter/material.dart';

class userScreen extends StatefulWidget {
  static String id = 'userScreen';

  @override
  _userScreenState createState() => _userScreenState();
}

class _userScreenState extends State<userScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              SizedBox(height: 20.0,),
              Text('Hi User',style: TextStyle(color: Color(0xffD0874C),fontSize: 20.0),),
              Text('Welcome Back',style: TextStyle(color: Colors.green,fontSize: 20.0),),
            ],
          )
      ),
    );
  }
}
