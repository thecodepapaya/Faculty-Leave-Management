import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInHandler extends StatefulWidget {
  @override
  _SignInHandlerState createState() => _SignInHandlerState();
}

class _SignInHandlerState extends State<SignInHandler> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    
    return Container();
  }
  
}
