import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:leave_management/Models/AppTimer.dart';
import 'package:leave_management/Utils/signInHandler.dart';
import 'package:leave_management/Utils/GlobalVariables.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  AppTimer ticker = AppTimer();
  WidgetsFlutterBinding.ensureInitialized();
  GlobalVariables.prefs = await SharedPreferences.getInstance();
  // await Firestore.instance.collection("meta").document("data").setData({
  //   "lastUsed": FieldValue.serverTimestamp(),
  // });

  // DocumentSnapshot docSnap =
  //     await Firestore.instance.collection("meta").document("data").get();
  // //get timestamp in milliseconds from FieldValue.serverTimeStamp
  // //in string
  // GlobalVariables.timeStamp = docSnap.data["lastUsed"].seconds.toString() +
  //     docSnap.data["lastUsed"].nanoseconds.toString().substring(0, 3);
  // print("Time stamp: ${GlobalVariables.timeStamp}");
  // GlobalVariables.timeStamp =
  //     GlobalVariables.prefs.getString(GlobalVariables.timeStampPrefs);
  // GlobalVariables.name =
  //     GlobalVariables.prefs.getString(GlobalVariables.namePrefs);
  // GlobalVariables.email =
  //     GlobalVariables.prefs.getString(GlobalVariables.emailPrefs);

  // print(
  //     "Fetched Details: \ntimestamp: ${GlobalVariables.timeStamp}\nemail: ${GlobalVariables.email}\nname: ${GlobalVariables.name}");

  Timer.periodic(Duration(days: 1), (_) {
    ticker.tickDay();
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInHandler(),
    );
  }
}
