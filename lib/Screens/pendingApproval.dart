import 'package:flutter/material.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';

class PendingApproval extends StatefulWidget {
  @override
  _PendingApprovalState createState() => _PendingApprovalState();
}

class _PendingApprovalState extends State<PendingApproval> {
  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Pending Approvals",
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                "M",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            title: Text("Medical Leave"),
            subtitle: Text("For High Fever"),
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                "C",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            title: Text("Casual Leave"),
            subtitle: Text("Leave no.: 5"),
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              color: Colors.brown,
              alignment: Alignment.center,
              child: Text(
                "F",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            title: Text("Full Pay Leave"),
            subtitle: Text("Leave no.: 3"),
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              color: Colors.green,
              alignment: Alignment.center,
              child: Text(
                "C",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            title: Text("Child Care"),
            subtitle: Text("For 12th Boards"),
          )
        ],
      ),
    );
  }
}
