import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';

import 'currentLeaveDetails.dart';

class CurrentApplications extends StatefulWidget {
  @override
  _CurrentApplicationsState createState() => _CurrentApplicationsState();
}

class _CurrentApplicationsState extends State<CurrentApplications> {
  Widget cardBuilder({String name, String type, String photoUrl}) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        child: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    type,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return CurrentLeaveDetails();
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
      title: "Current Applications",
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("admin").getDocuments(),
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
              // print("lengths " + snapshot.data.documents.length.toString());
              return GridView.count(
                crossAxisCount: 2,
                children: List<Widget>.generate(length, (index) {
                  return GridTile(
                    child: cardBuilder(
                      name: snapshot.data.documents[index].data["name"],
                      photoUrl: snapshot.data.documents[index].data["photoUrl"],
                      type: snapshot.data.documents[index].data["type"],
                    ),
                  );
                }),
              );
            }
          }
        },
      ),
    );
  }
}
