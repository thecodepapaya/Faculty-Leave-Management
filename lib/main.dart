import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:leave_management/Models/AppTimer.dart';
import 'package:leave_management/Utils/signInHandler.dart';

void main() async {
  AppTimer ticker = AppTimer();
  Timer.periodic(Duration(days: 1), (_) {
    ticker.tickDay();
  });

  await Future.delayed(
    Duration(seconds: 10),
  );

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
