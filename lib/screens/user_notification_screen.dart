import 'package:campus_emargency_project_ui/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:campus_emargency_project_ui/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
final _firebase = FirebaseFirestore.instance.collection('adminNotification');
List<Text> users = [];

class userNotificationScreen extends StatefulWidget {
  static String id = 'userNotificationScreen';

  @override
  _userNotificationScreenState createState() => _userNotificationScreenState();
}

class _userNotificationScreenState extends State<userNotificationScreen> {
  User loggedUser;

  //
  initState() {
    super.initState();
    getCurrentUser();
    getAdminNotification();
    // getUser();
  }

  // getUser() async {
  //   final QuerySnapshot snapshot =
  //   await _firebase.get();
  //    setState(() {
  //      users = snapshot;
  //    });
  // }
  getAdminNotification() async {
    final notifies = _firebase.get();
    final notification = notifies.then((value) => value.docs.forEach((element) {
          element.data();
        }));
    print(notification);
    setState(() {});
  }

  Future getUser() async {
    final snapshot = await _firebase.get();
    snapshot.docs.forEach((element) {
      element.data();
      print(element.data());
    });
  }

  getCurrentUser() async {
    final user = await _auth.currentUser;
    if (user != null) {
      loggedUser = user;
    }
    print(loggedUser.email);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FlatButton(child:Text("hello"),onPressed: (){
          Navigator.pop(context);
        },)
        // StreamBuilder<QuerySnapshot>(
        //   stream: _firebase.snapshots(),
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return CircularProgressIndicator();
        //     }
        //     {
        //       final List<Text> messages = [];
        //       for (var message in messages) {
        //         final notification = message.data;
        //         messages.add(Text(notification));
        //       }
        //       return ListView(
        //         children: messages,
        //       );
        //     }
        //   },
        // ),
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

// final List<Text> children = snapshot.data.docs;
// final notifications = snapshot.data.docs;
// notifications.forEach((DocumentSnapshot notifcation) =>print(notifcation.data()));
// return ListView(
// children: notifications,
// );
