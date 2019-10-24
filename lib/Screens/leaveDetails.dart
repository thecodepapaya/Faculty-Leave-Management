import 'package:flutter/material.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';

class LeaveDetails extends StatefulWidget {
  @override
  _LeaveDetailsState createState() => _LeaveDetailsState();
}

class _LeaveDetailsState extends State<LeaveDetails> {
  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Leave Details",
      body: Center(
        child: Text("Leave Details would be shown here"),
      ),
    );
  }
}
