import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:leave_management/Utils/GlobalVariables.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';
import 'package:leave_management/Utils/houseKeeping.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Sign In",
      body: Center(
        child: RaisedButton(
          child: Text("Sign In"),
          onPressed: handleGoogleSignIn,
        ),
      ),
    );
  }

  Future<FirebaseUser> handleGoogleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    //save global variables
    GlobalVariables.user = user;
    // HouseKeeping.initializeUserData(emailId: user.email);
    // GlobalVariables.prefs.setString(GlobalVariables.emailPrefs, user.email);
    // GlobalVariables.prefs
    //     .setString(GlobalVariables.namePrefs, user.displayName);
    // GlobalVariables.prefs.setString(GlobalVariables.timeStampPrefs,
    //     DateTime.now().millisecondsSinceEpoch.toString());
    print("======Successfully saved global variables");
    // GlobalVariables.user = user;
    return user;
  }
}
