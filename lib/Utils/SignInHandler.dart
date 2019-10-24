import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:leave_management/Screens/HomePage.dart';
import 'package:leave_management/Screens/SignInScreen.dart';

class SignInHandler extends StatefulWidget {
  @override
  _SignInHandlerState createState() => _SignInHandlerState();
}

class _SignInHandlerState extends State<SignInHandler> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            return HomePage(
              user: snapshot.data,
            );
          } else {
            return SignInScreen();
          }
        }
      },
    );
  }
}
