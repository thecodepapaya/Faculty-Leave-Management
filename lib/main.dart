import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leave_management/Models/AppTimer.dart';
import 'package:leave_management/Utils/signInHandler.dart';

void main() {
  AppTimer ticker = AppTimer();
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
