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

  Widget cardBuilder({
    @required DocumentSnapshot snapshot,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: HouseKeeping.randomColor(density: 100),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 130,
            width: 450,
            child: ListTile(
              title: Text(
                snapshot.data["subject"],
                style: TextStyle(fontSize: 25),
              ),
              subtitle: listDetail(snapshot.data["type"],
                  snapshot.data["startDate"], snapshot.data["endDate"]),
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
                      snapshot: snapshot.data.documents[index],
                      // snapshot.data.documents[index].data["subject"],
                      // snapshot.data.documents[index].data["type"],
                      // snapshot.data.documents[index].data["startDate"],
                      // snapshot.data.documents[index].data["endDate"],
                      // snapshot.data.documents[index].data["isGranted"],
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
