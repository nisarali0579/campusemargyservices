import 'package:campus_emargency_project_ui/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:campus_emargency_project_ui/screens/user_login_screen.dart';
import 'package:campus_emargency_project_ui/screens/admin_screen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

// Future<bool> authenticateUser(User user) async {
//   QuerySnapshot querySnapshot = await _firestore.collection("users").where("email", isEqualTo: user.email).get();
//   final List<DocumentSnapshot> docs = querySnapshot.docs;
//   return docs.length == 0 ? true : false;
// }

FirebaseFirestore _firestore = FirebaseFirestore.instance;

 mixin UserManagement {
  // Widget handleAuth(){
  //   return new StreamBuilder(
  //     stream: FirebaseAuth.instance.authStateChanges(),
  //     builder: (BuildContext context,snapshot){
  //       if(snapshot.hasData){
  //         return userScreen();
  //       }
  //       return UserLoginScreen();
  //     },
  //   );
  // }

//FirebaseAuth firebase = FirebaseAuth.instance;

  // authorizeAccess(BuildContext context) {
  //   QuerySnapshot user = firebase.auth.currentUser().then((user) {
  //     FirebaseFirestore.instance
  //         .collection('user')
  //         .where('uid', isEqualTo: user.uid)
  //         .getDocuments()
  //         .then((docs.documents[0].exit){
  //     if(docs.documents[0].data['role'] == 'admin'){
  //     Navigator.pushNamed(context, adminScreen.id);
  //     }else{
  //
  //     }
  //     }
  //     );
  //   }
  //   );
  // }

  Future authorizeAccesss(User user) async {
    QuerySnapshot querySnapshot = await _firestore.collection('admin').where(
        'email', isEqualTo: user.email).get();
    final List<DocumentSnapshot> docs = querySnapshot.docs;

    if (docs.length == 0) {
      return print("admin login");
    } else {
      return print("nor Authorize by admin");;
    }
  }
}


signOut() {
  FirebaseAuth.instance.signOut();
}

// authorizeAccess(BuildContext context) {
//   FirebaseAuth.instance.currentUser().then((user) {
//     FirebaseFirestore.instance
//         .collection('user')
//         .where('uid', isEqualTo: user.uid)
//         .getDocuments()
//         .then((docs.documents[0].exit){
//     if(docs.documents[0].data['role'] == 'admin'){
//     Navigator.pushNamed(context, adminScreen.id);
//     }else{
//
//     }
//     }
//     );
//   }
//   );
// }