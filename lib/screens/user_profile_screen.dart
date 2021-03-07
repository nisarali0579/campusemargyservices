import 'package:flutter/material.dart';


 class userProfileScreen extends StatefulWidget {
   static String id = 'userProfileScreen';
   @override
   _userProfileScreenState createState() => _userProfileScreenState();
 }

 class _userProfileScreenState extends State<userProfileScreen> {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(debugShowCheckedModeBanner: false,
       home: Scaffold(backgroundColor: Color(0xffD0874C),
         body:  ListView(
           children: [
             Text("Profile page")
           ],
         ),
       ),
     );
   }
 }
