import 'package:flutter/material.dart';
import 'package:campus_emargency_project_ui/utils/utils.dart';
import 'package:campus_emargency_project_ui/Widgets/card_widget_screen.dart';
import 'user_menu_screen.dart';
import 'package:campus_emargency_project_ui/services/user_management_screen.dart';
import 'login_home.dart';

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
        backgroundColor: Color(0XFFF7F7F7),
        appBar: AppBar(
          actions: [
            // Center(
            //     child: Text(
            //   "logout",
            //   style: TextStyle(fontSize: 20.0),
            // )),
            IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: (){
                  Navigator.pushNamed(context, loginHome.id);
                })
          ],
          title: Text('Student Page'),
          backgroundColor: Color(0xffD0874C),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, UserMenuScreen.id);
            },
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hi User',
                  style: TextStyle(color: Color(0xffD0874C), fontSize: 20.0),
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(color: Colors.green, fontSize: 20.0),
                ),
              ],
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
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
                )),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                  child: Utils.smallButton('Send', () {
                    Navigator.pushNamed(context, UserMenuScreen.id);
                  }),
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
                  Cards(
                    icon: Icon(Icons.photo_library_rounded),
                    name: "Upload File",
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Cards(
                    icon: Icon(Icons.photo_camera_rounded),
                    name: "Camera",
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Cards(
                    icon: Icon(Icons.add_alert),
                    name: "Notification",
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 20.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
