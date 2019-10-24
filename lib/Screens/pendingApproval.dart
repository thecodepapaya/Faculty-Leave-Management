import 'package:flutter/material.dart';

class PendingApproval extends StatefulWidget {
  @override
  _PendingApprovalState createState() => _PendingApprovalState();
}

class _PendingApprovalState extends State<PendingApproval> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pending Approvals"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Medical Leave"),
            subtitle: Text("For High Fever"),
          ),
          ListTile(
            title: Text("Casual Leave"),
          ),
          ListTile(
            title: Text("Full Pay Leave"),
          ),
          ListTile(
            title: Text("Child Care"),
            subtitle: Text("For 12th Boards"),
          )
        ],
      ),
    );
  }
}
