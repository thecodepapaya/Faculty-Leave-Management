import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:leave_management/Screens/adminDashboard.dart';
import 'package:leave_management/Screens/currentApplications.dart';

import 'GlobalVariables.dart';

class LeaveScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget floatingButton;
  LeaveScaffold({
    @required this.body,
    @required this.title,
    this.floatingButton,
  });
  @override
  _LeaveScaffoldState createState() => _LeaveScaffoldState();
}

class _LeaveScaffoldState extends State<LeaveScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // actions: <Widget>[
        //   FlatButton(
        //     child: Icon(Icons.update),
        //     onPressed: () async {
        //       for (int i = 0; i < GlobalVariables.leavesList.length; i++)
        //         await Firestore.instance
        //             .collection(GlobalVariables.user.email)
        //             .document(GlobalVariables.leavesList[i])
        //             .setData({
        //           "remaining": 10,
        //           "total": 3,
        //         });
        //     },
        //   ),
        //   // FlatButton(
        //   //   child: Icon(Icons.exit_to_app),
        //   //   onPressed: () async {
        //   //     await FirebaseAuth.instance.signOut();
        //   //     await GoogleSignIn().signOut();
        //   //   },
        //   // ),
        //   // FlatButton(
        //   //   child: Icon(Icons.home),
        //   //   onPressed: () {
        //   //     Navigator.of(context).push(
        //   //       MaterialPageRoute(
        //   //         builder: (BuildContext context) {
        //   //           return AdminDashboard(
        //   //             user: GlobalVariables.user,
        //   //           );
        //   //         },
        //   //       ),
        //   //     );
        //   //   },
        //   // ),
        // ],
      ),
      body: widget.body,
      floatingActionButton: widget.floatingButton,
    );
  }
}
