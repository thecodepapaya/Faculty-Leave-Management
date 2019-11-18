import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:leave_management/Screens/pastLeaveDetails.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';

class PreviousApplications extends StatefulWidget {
  @override
  _PreviousApplicationsState createState() => _PreviousApplicationsState();
}

class _PreviousApplicationsState extends State<PreviousApplications> {
  Widget cardBuilder({
    @required String name,
    @required String reason,
    @required String photoUrl,
    @required DocumentSnapshot snapshot,
  }) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  maxRadius: MediaQuery.of(context).size.height * 0.05,
                  backgroundImage: NetworkImage(
                    photoUrl,
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                reason,
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return PastLeaveDetails(
                  snapshot: snapshot,
                );
              },
            ),
          );
        },
        splashColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Previous Applications",
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("admin")
            .where("isChecked", isEqualTo: true)
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
              return GridView.count(
                crossAxisCount: 2,
                children: List<Widget>.generate(length, (index) {
                  return GridTile(
                      child: cardBuilder(
                    name: snapshot.data.documents[index].data["name"],
                    photoUrl: snapshot.data.documents[index].data["photoUrl"],
                    reason: snapshot.data.documents[index].data["reason"],
                    snapshot: snapshot.data.documents[index],
                  ));
                }),
              );
            }
          }
        },
      ),
    );
  }
}
