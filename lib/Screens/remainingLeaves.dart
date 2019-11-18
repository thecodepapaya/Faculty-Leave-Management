import 'package:flutter/material.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:leave_management/Utils/GlobalVariables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RemainingLeaves extends StatefulWidget {
  @override
  _RemainingLeavesState createState() => _RemainingLeavesState();
}

class _RemainingLeavesState extends State<RemainingLeaves> {
  Widget image1(Icon icn) {
    return Container(
      width: 70.0,
      height: 70.0,
      child: CircleAvatar(child: icn),
    );
    // decoration: BoxDecoration(
    //   shape: BoxShape.circle,

    //   image: DecorationImage(
    //     fit: BoxFit.cover,
    //     image: AssetImage(),
    //   ),
  }

  Widget detailsCard(String title, Color dikh, int tot, int rem) {
    // print("============================");
    // print(tot);
    // print(rem);
    return Container(
      width: 450,
      height: 100.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: dikh,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(title, style: TextStyle(color: Colors.white, fontSize: 22)),
              Row(
                children: <Widget>[Text('Total : '), Text('$tot')],
              ),
              Row(
                children: <Widget>[Text('Remaining : '), Text('$rem')],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Remaining Leaves",
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("${GlobalVariables.user.email}")
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
              // print("sdsdsdssdddddddddddddddddddddddddddddd");
              // print(snapshot.data.documents[5].data["total"]);
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 8.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "MedicalLeave",
                                  Colors.red[300],
                                  snapshot.data.documents[8].data["total"],
                                  snapshot.data.documents[8].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child: new Icon(FontAwesomeIcons.medkit)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 1.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "Casual Leave",
                                  Colors.blue[300],
                                  snapshot.data.documents[0].data["total"],
                                  snapshot.data.documents[0].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child: new Icon(FontAwesomeIcons.userTie)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 8.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "Paid Leave",
                                  Colors.green[300],
                                  snapshot.data.documents[4].data["total"],
                                  snapshot.data.documents[4].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child: new Icon(FontAwesomeIcons.moneyBill)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 8.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "Child Care",
                                  Colors.deepPurple[200],
                                  snapshot.data.documents[1].data["total"],
                                  snapshot.data.documents[1].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child: new Icon(FontAwesomeIcons.child)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 8.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "Paternity Leave",
                                  Colors.lightGreen[200],
                                  snapshot.data.documents[9].data["total"],
                                  snapshot.data.documents[9].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child: new Icon(FontAwesomeIcons.male)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 8.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "Special Casual Leave",
                                  Colors.orange[200],
                                  snapshot.data.documents[12].data["total"],
                                  snapshot
                                      .data.documents[12].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child: new Icon(FontAwesomeIcons.userTie)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 8.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "Vacation Leave",
                                  Colors.orange[200],
                                  snapshot.data.documents[13].data["total"],
                                  snapshot
                                      .data.documents[13].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child: new Icon(FontAwesomeIcons.cannabis)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 8.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "Extra ordinary",
                                  Colors.blue[300],
                                  snapshot.data.documents[2].data["total"],
                                  snapshot.data.documents[2].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child:
                                    new Icon(FontAwesomeIcons.chargingStation)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 8.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "Leave not due",
                                  Colors.green[300],
                                  snapshot.data.documents[5].data["total"],
                                  snapshot.data.documents[5].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child: new Icon(FontAwesomeIcons.angry)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 8.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "Lien",
                                  Colors.deepPurple[200],
                                  snapshot.data.documents[6].data["total"],
                                  snapshot.data.documents[6].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child:
                                    new Icon(FontAwesomeIcons.planeDeparture)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 8.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "Sabbatical Leave",
                                  Colors.lightGreen[200],
                                  snapshot.data.documents[10].data["total"],
                                  snapshot
                                      .data.documents[10].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child: new Icon(FontAwesomeIcons.award)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 8.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "Special Leave",
                                  Colors.orange[200],
                                  snapshot.data.documents[11].data["total"],
                                  snapshot
                                      .data.documents[11].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child: new Icon(FontAwesomeIcons.stripeS)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 8.0),
                      child: Container(
                        height: 115,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 40.0,
                              child: detailsCard(
                                  "Maternity",
                                  Colors.orange[200],
                                  snapshot.data.documents[7].data["total"],
                                  snapshot.data.documents[7].data["remaining"]),
                            ),
                            Positioned(
                                top: 27.5,
                                child: new Icon(FontAwesomeIcons.female)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
