import 'package:flutter/material.dart';
import 'package:campus_emargency_project_ui/services/user_management_screen.dart';
import 'user_screen.dart';
import 'user_notification_screen.dart';
import 'user_profile_screen.dart';

class UserMenuScreen extends StatefulWidget {
  static String id = 'UserMenuScreen';

  @override
  _UserMenuScreenState createState() => _UserMenuScreenState();
}

class _UserMenuScreenState extends State<UserMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Center(child: Text('Menu')),
                decoration: BoxDecoration(
                  color: Color(0xffD0874C),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon:
                                Icon(Icons.accessibility, color: Colors.black),
                            onPressed: (){
                              Navigator.pushNamed(context, userProfileScreen.id);
                            }),
                        Text(
                            "My Profile",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.notifications_on,
                                color: Colors.black),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, userNotificationScreen.id);
                            }),
                        Text(
                          "Notification",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.logout, color: Colors.black),
                            onPressed: () {
                              Navigator.pushNamed(context, userScreen.id);
                            }),
                        GestureDetector(
                          onTap: null,
                          child: Text(
                            "log out",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
