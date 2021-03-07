import 'package:flutter/material.dart';
import 'package:campus_emargency_project_ui/utils/utils.dart';

class userNotificationScreen extends StatefulWidget {
  static String id = 'userNotificationScreen';

  @override
  _userNotificationScreenState createState() => _userNotificationScreenState();
}

class _userNotificationScreenState extends State<userNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0XFFF7F7F7),
        appBar: AppBar(
          elevation: 5,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Center(child: Text("Notifications",style: TextStyle(fontSize: 25.0,color: Colors.red),)),
            SizedBox(
              height: 50.0,
            ),
            Utils.notifcation(),
            SizedBox(
              height: 20.0,
            ),
            Utils.notifcation(),
            SizedBox(
              height: 20.0,
            ),
            Utils.notifcation(),
            SizedBox(
              height: 20.0,
            ),
            Utils.notifcation(),
            SizedBox(
              height: 20.0,
            ),
            Utils.notifcation(),
            SizedBox(
              height: 20.0,
            ),
            Utils.notifcation(),
          ],
        ),
      ),
    );
  }

}

// child: TextField(
//   style: TextStyle(fontSize: 20.0),
//   maxLines: 10,
//   decoration: InputDecoration(
//     border: OutlineInputBorder(
//       borderSide: BorderSide.none,
//       borderRadius: BorderRadius.circular(33.0),
//     ),
//
//     fillColor: Colors.white,
//     filled: true,
//     hintText: 'Notification',
//   ),
// ),
