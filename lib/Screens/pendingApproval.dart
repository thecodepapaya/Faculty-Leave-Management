import 'package:flutter/material.dart';
import 'package:leave_management/Screens/leaveDetails.dart';
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
            title: Text("Medical Leave"),
            subtitle: Text("For High Fever"),
          ),
          ListTile(
            title: Text("Casual Leave"),
            subtitle: Text("Leave no.: 5"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LeaveDetails();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text("Full Pay Leave"),
            subtitle: Text("Leave no.: 3"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LeaveDetails();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text("Child Care"),
            subtitle: Text("For 12th Boards"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LeaveDetails();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
