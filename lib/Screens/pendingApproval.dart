import 'package:flutter/material.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';
import 'package:leave_management/Screens/leaveDetails.dart';

class PendingApproval extends StatefulWidget {
  @override
  _PendingApprovalState createState() => _PendingApprovalState();
}

class _PendingApprovalState extends State<PendingApproval> {
  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Pending Approvals",
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 26,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: Text("Medical Leave"),
                  subtitle: Text("For High Fever"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                // shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "C",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: Text("Casual Leave"),
                  subtitle: Text("Leave no.: 5"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LeaveDetails(
                            title: "Leave Type",
                            reason: "Reason for Leave",
                            fromDate: "ample date",
                            toDate: "another date",
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.attach_money,
                      size: 26,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: Text("Full Pay Leave"),
                  subtitle: Text("Leave no.: 3"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LeaveDetails(
                            title: "Leave Type",
                            reason: "Reason for Leave",
                            fromDate: "ample date",
                            toDate: "another date",
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.child_care,
                      color: Colors.white,
                      size: 26,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: Text("Child Care"),
                  subtitle: Text("For 12th Boards"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LeaveDetails(
                            title: "Leave Type",
                            reason: "Reason for Leave",
                            fromDate: "ample date",
                            toDate: "another date",
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
