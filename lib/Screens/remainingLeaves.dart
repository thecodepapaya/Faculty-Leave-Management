import 'package:flutter/material.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RemainingLeaves extends StatefulWidget {
  @override
  _RemainingLeavesState createState() => _RemainingLeavesState();
}

class _RemainingLeavesState extends State<RemainingLeaves> {
  Widget get image1 {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/image.png'),
        ),
      ),
    );
  }

  Widget detailsCard(String title, Color dikh) {
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
                children: <Widget>[Text('Total : '), Text('100')],
              ),
              Row(
                children: <Widget>[Text('Remaining : '), Text('100')],
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
      body: FutureBuilder(
        future: Firestore.instance.collection("farmers").document("an").get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                              child:
                                  detailsCard("MedicalLeave", Colors.red[300]),
                            ),
                            Positioned(top: 16.5, child: image1),
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
                              child:
                                  detailsCard("Casual Leave", Colors.blue[300]),
                            ),
                            Positioned(top: 16.5, child: image1),
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
                              child:
                                  detailsCard("Paid Leave", Colors.green[300]),
                            ),
                            Positioned(top: 16.5, child: image1),
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
                                  "Child Care", Colors.deepPurple[200]),
                            ),
                            Positioned(top: 16.5, child: image1),
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
                                  "Paternity Leave", Colors.lightGreen[200]),
                            ),
                            Positioned(top: 16.5, child: image1),
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
                                  "Special Casual Leave", Colors.orange[200]),
                            ),
                            Positioned(top: 16.5, child: image1),
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
                                  "Vacation Leave", Colors.red[300]),
                            ),
                            Positioned(top: 16.5, child: image1),
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
                                  "Extra ordinary", Colors.blue[300]),
                            ),
                            Positioned(top: 16.5, child: image1),
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
                                  "Leave not due", Colors.green[300]),
                            ),
                            Positioned(top: 16.5, child: image1),
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
                              child:
                                  detailsCard("Lien", Colors.deepPurple[200]),
                            ),
                            Positioned(top: 16.5, child: image1),
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
                                  "Sabattial Leave", Colors.lightGreen[200]),
                            ),
                            Positioned(top: 16.5, child: image1),
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
                                  "Special Leave", Colors.orange[200]),
                            ),
                            Positioned(top: 16.5, child: image1),
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
