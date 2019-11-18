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
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage("assets/images/sign.jpeg"),
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                SizedBox(
                  height: 200,
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.white,
                          width: 3)),
                  child: FlatButton(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    onPressed: handleGoogleSignIn,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<FirebaseUser> handleGoogleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    //save global variables
    GlobalVariables.user = user;
    HouseKeeping.initializeUserData(emailId: user.email);
    // GlobalVariables.prefs.setString(GlobalVariables.emailPrefs, user.email);
    // GlobalVariables.prefs
    //     .setString(GlobalVariables.namePrefs, user.displayName);
    GlobalVariables.prefs.setString(GlobalVariables.timeStampPrefs,
        DateTime.now().millisecondsSinceEpoch.toString());
    print("======Successfully saved global variables");
    GlobalVariables.user = user;
    return user;
  }
}
