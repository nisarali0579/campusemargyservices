
import 'package:flutter/material.dart';
import 'package:campus_emargency_project_ui/utils/utils.dart';
import 'package:campus_emargency_project_ui/Widgets/card_widget_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class adminScreen extends StatefulWidget {
  static String id = 'adminScreen';

  @override
  _adminScreenState createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0XFFF7F7F7),
          body: ListView(
            children: [
             Container(
               child: Column(
                 children: [
                   SizedBox(
                     height: 20.0,
                   ),
                   Text(
                     'Hi Admin',
                     style: TextStyle(color: Color(0xffD0874C), fontSize: 20.0),
                   ),
                   Text(
                     'Welcome Back',
                     style: TextStyle(color: Colors.green, fontSize: 15.0),
                   ),
                 ],
               ),
             ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    child: Material(
                     // elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                        child: SizedBox(
                          width: 350.0,
                          height: 100.0,
                          child: TextField(
                            style: TextStyle(fontSize: 20.0),
                            maxLines: 10,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter Your Text',
                                ),
                          ),
                        ),
                      ),
                    )
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                    child: Utils.smallButton('Send', () {}),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Cards(icon: Icon(Icons.accessibility),name: "Student Management",onPressed: (){},),
                    SizedBox(
                      width: 20.0,
                    ),
                    Cards(icon: Icon(Icons.account_balance_wallet_rounded),name: "Account",onPressed: (){},),
                    SizedBox(
                      width: 20.0,
                    ),
                    Cards(icon: Icon(Icons.logout),name: "Logout",onPressed: (){},),
                    SizedBox(
                      width: 20.0,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Cards(icon: Icon(Icons.notifications_on),name: "Notification",onPressed: (){},),

                    SizedBox(
                      width: 20.0,
                    ),
                    Cards(icon: Icon(Icons.add),name:"add",onPressed: (){},),
                    SizedBox(
                      width: 20.0,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

