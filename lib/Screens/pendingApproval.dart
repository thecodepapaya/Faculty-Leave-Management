import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:leave_management/Utils/GlobalVariables.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';
import 'package:leave_management/Screens/leaveDetails.dart';

class PendingApproval extends StatefulWidget {
  @override
  _PendingApprovalState createState() => _PendingApprovalState();
}

class _PendingApprovalState extends State<PendingApproval> {
  Widget leaveCard({@required DocumentSnapshot snapshot, Color clr}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            child: Text(
              "${snapshot.data["type"]}".substring(0, 1),
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            decoration: BoxDecoration(
                color: (snapshot.data["type"] == "Casual")
                    ? Colors.blue[300]
                    : (snapshot.data["type"] == "Medical")
                        ? Colors.red[300]
                        : ((snapshot.data["type"] == "ChildCare")
                            ? Colors.deepPurple[200]
                            : (snapshot.data["type"] == "FullPaid")
                                ? Colors.green[300]
                                : (snapshot.data["type"] == "Paternity")
                                    ? Colors.lightGreen[200]
                                    : ((snapshot.data["type"] == "Vacation")
                                        ? Colors.orange[200]
                                        : (snapshot.data["type"] == "Lien")
                                            ? Colors.deepPurple[200]
                                            : (snapshot.data["type"] ==
                                                    "Sabbatical")
                                                ? Colors.lightGreen[200]
                                                : (snapshot.data["type"] ==
                                                        "Special")
                                                    ? Colors.orange[200]
                                                    : Colors.lightBlue[200])),
                borderRadius: BorderRadius.circular(10)),
          ),
          title: Text("${snapshot.data["type"]}"),
          subtitle: Text("${snapshot.data["subject"]}"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return LeaveDetails(
                    snapshot: snapshot,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Pending Approvals",
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("admin")
            .where("email", isEqualTo: GlobalVariables.user.email)
            .where("isChecked", isEqualTo: false)
            .getDocuments(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: SpinKitWanderingCubes(
                color: Colors.red,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error occured"),
              );
            } else {
              int length = snapshot.data.documents.length;
              return ListView.builder(
                itemCount: length,
                itemBuilder: (BuildContext context, int index) {
                  return leaveCard(
                    snapshot: snapshot.data.documents[index],
                  );
                },
              );
              // return SingleChildScrollView(
              //   child: Column(
              //     children: [
              //       leaveCard(
              //         snapshot: snapshot.data.documents.
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              //         child: Card(
              //           child: ListTile(
              //             leading: Container(
              //               height: 50,
              //               width: 50,
              //               alignment: Alignment.center,
              //               child: Icon(
              //                 Icons.add,
              //                 color: Colors.white,
              //                 size: 26,
              //               ),
              //               decoration: BoxDecoration(
              //                   color: Colors.red,
              //                   borderRadius: BorderRadius.circular(10)),
              //             ),
              //             title: Text("Medical Leave"),
              //             subtitle: Text("For High Fever"),
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              //         child: Card(
              //           // shape: RoundedRectangleBorder(
              //           // borderRadius: BorderRadius.circular(15)),
              //           child: ListTile(
              //             leading: Container(
              //               height: 50,
              //               width: 50,
              //               alignment: Alignment.center,
              //               child: Text(
              //                 "C",
              //                 style:
              //                     TextStyle(fontSize: 24, color: Colors.white),
              //               ),
              //               decoration: BoxDecoration(
              //                   color: Colors.blue,
              //                   borderRadius: BorderRadius.circular(10)),
              //             ),
              //             title: Text("Casual Leave"),
              //             subtitle: Text("Leave no.: 5"),
              //             onTap: () {
              //               Navigator.of(context).push(
              //                 MaterialPageRoute(
              //                   builder: (BuildContext context) {
              //                     return LeaveDetails(
              //                       title: "Leave Type",
              //                       reason: "Reason for Leave",
              //                       fromDate: "ample date",
              //                       toDate: "another date",
              //                     );
              //                   },
              //                 ),
              //               );
              //             },
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              //         child: Card(
              //           child: ListTile(
              //             leading: Container(
              //               height: 50,
              //               width: 50,
              //               alignment: Alignment.center,
              //               child: Icon(
              //                 Icons.attach_money,
              //                 size: 26,
              //                 color: Colors.white,
              //               ),
              //               decoration: BoxDecoration(
              //                   color: Colors.green,
              //                   borderRadius: BorderRadius.circular(10)),
              //             ),
              //             title: Text("Full Pay Leave"),
              //             subtitle: Text("Leave no.: 3"),
              //             onTap: () {
              //               Navigator.of(context).push(
              //                 MaterialPageRoute(
              //                   builder: (BuildContext context) {
              //                     return LeaveDetails(
              //                       title: "Leave Type",
              //                       reason: "Reason for Leave",
              //                       fromDate: "ample date",
              //                       toDate: "another date",
              //                     );
              //                   },
              //                 ),
              //               );
              //             },
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              //         child: Card(
              //           child: ListTile(
              //             leading: Container(
              //               height: 50,
              //               width: 50,
              //               alignment: Alignment.center,
              //               child: Icon(
              //                 Icons.child_care,
              //                 color: Colors.white,
              //                 size: 26,
              //               ),
              //               decoration: BoxDecoration(
              //                   color: Colors.brown,
              //                   borderRadius: BorderRadius.circular(10)),
              //             ),
              //             title: Text("Child Care"),
              //             subtitle: Text("For 12th Boards"),
              //             onTap: () {
              //               Navigator.of(context).push(
              //                 MaterialPageRoute(
              //                   builder: (BuildContext context) {
              //                     return LeaveDetails(
              //                       title: "Leave Type",
              //                       reason: "Reason for Leave",
              //                       fromDate: "ample date",
              //                       toDate: "another date",
              //                     );
              //                   },
              //                 ),
              //               );
              //             },
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // );
            }
          }
        },
      ),
    );
  }
}
