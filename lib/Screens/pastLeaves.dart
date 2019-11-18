import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:leave_management/Screens/leaveDetails.dart';
import 'package:leave_management/Utils/GlobalVariables.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';
import 'package:leave_management/Utils/houseKeeping.dart';

class PastLeaves extends StatefulWidget {
  @override
  _PastLeavesState createState() => _PastLeavesState();
}

class _PastLeavesState extends State<PastLeaves> {
  Widget listDetail(String type, String from, String to) {
    return Text(
      type + "\n" + "From :" + from + "\n" + "To :" + to,
      style: TextStyle(fontSize: 15),
    );
  }

  Widget cardBuilder(
      String subject, String type, String from, String to, bool status,
      {Color clr}) {

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: clr,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 130,
            width: 450,
            child: ListTile(
              title: Text(
                subject,
                style: TextStyle(fontSize: 25),
              ),
              subtitle: listDetail(type,from,to),
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return LeaveDetails(
                //         snapshot: snapshot,
                //       );
                //     },
                //   ),
                // );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Past Leaves",
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("admin")
            .where("isChecked", isEqualTo: true)
            .where("email", isEqualTo: GlobalVariables.email)
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
                child: Text("Error occured: ${snapshot.error}"),
              );
            } else {
              int length = snapshot.data.documents.length;
              return ListView.builder(
                itemCount: length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    child: cardBuilder(
                      snapshot.data.documents[index].data["subject"],
                      snapshot.data.documents[index].data["type"],
                      snapshot.data.documents[index].data["startDate"],
                      snapshot.data.documents[index].data["endDate"],
                      snapshot.data.documents[index].data["isGranted"],
                      clr: (snapshot.data.documents[index].data["type"] ==
                              "Casual")
                          ? Colors.blue[300]
                          : (snapshot.data.documents[index].data["type"] ==
                                  "Medical")
                              ? Colors.red[300]
                              : ((snapshot.data.documents[index].data["type"] ==
                                      "ChildCare")
                                  ? Colors.deepPurple[200]:
                                  (snapshot.data.documents[index].data["type"] ==
                              "Paid Leave")
                          ? Colors.green[300]
                          : (snapshot.data.documents[index].data["type"] ==
                                  "Paternity")
                              ? Colors.lightGreen[200]
                              : ((snapshot.data.documents[index].data["type"] ==
                                      "Vacation")
                                  ? Colors.orange[200]:
                                  (snapshot.data.documents[index].data["type"] ==
                              "Lien")
                          ? Colors.deepPurple[200]
                          : (snapshot.data.documents[index].data["type"] ==
                                  "Sabbatical")
                              ? Colors.lightGreen[200]
                              : (snapshot.data.documents[index].data["type"] ==
                                      "Special")
                                  ? Colors.orange[200]
                                  : Colors.lightBlue[200])),
                    ),
                  );
                },
                // crossAxisCount: 2,
                // children: List<Widget>.generate(length, (index) {
                //   return Card(
                //     child: cardBuilder(
                //       name: snapshot.data.documents[index].data["name"],
                //       photoUrl: snapshot.data.documents[index].data["photoUrl"],
                //       type: snapshot.data.documents[index].data["type"],
                //       snapshot: snapshot.data.documents[index],
                //     ),
                //   );
                // }),
              );
            }
          }
        },
      ),
    );
  }
}
