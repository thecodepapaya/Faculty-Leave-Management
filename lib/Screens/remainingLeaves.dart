<<<<<<< HEAD

=======
import 'package:flutter/material.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';

class RemainingLeaves extends StatefulWidget {
  @override
  _RemainingLeavesState createState() => _RemainingLeavesState();
}

class _RemainingLeavesState extends State<RemainingLeaves> {
  Widget get image1 {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/images.png'),
        ),
      ),
    );
  }

  Widget detailsCard(String title, Color dikh) {
    return Container(
      width: 450,
      height: 115.0,
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Container(
                height: 115,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 50.0,
                      child: detailsCard("MedicalLeave", Colors.red[300]),
                    ),
                    Positioned(top: 7.5, child: image1),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Container(
                height: 115,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 50.0,
                      child: detailsCard("Casual Leave", Colors.blue[300]),
                    ),
                    Positioned(top: 7.5, child: image1),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Container(
                height: 115,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 50.0,
                      child: detailsCard("Paid Leave", Colors.green[300]),
                    ),
                    Positioned(top: 7.5, child: image1),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Container(
                height: 115,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 50.0,
                      child: detailsCard("Child Care", Colors.deepPurple[200]),
                    ),
                    Positioned(top: 7.5, child: image1),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Container(
                height: 115,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 50.0,
                      child: detailsCard(
                          "Paternity Leave", Colors.lightGreen[200]),
                    ),
                    Positioned(top: 7.5, child: image1),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Container(
                height: 115,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 50.0,
                      child: detailsCard(
                          "Special Casual Leave", Colors.orange[200]),
                    ),
                    Positioned(top: 7.5, child: image1),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Container(
                height: 115,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 50.0,
                      child: detailsCard("Vacation Leave", Colors.red[300]),
                    ),
                    Positioned(top: 7.5, child: image1),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Container(
                height: 115,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 50.0,
                      child: detailsCard("Extra ordinary", Colors.blue[300]),
                    ),
                    Positioned(top: 7.5, child: image1),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Container(
                height: 115,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 50.0,
                      child: detailsCard("Leave not due", Colors.green[300]),
                    ),
                    Positioned(top: 7.5, child: image1),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Container(
                height: 115,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 50.0,
                      child: detailsCard("Lien", Colors.deepPurple[200]),
                    ),
                    Positioned(top: 7.5, child: image1),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Container(
                height: 115,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 50.0,
                      child: detailsCard(
                          "Sabattial Leave", Colors.lightGreen[200]),
                    ),
                    Positioned(top: 7.5, child: image1),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Container(
                height: 115,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 50.0,
                      child: detailsCard("Special Leave", Colors.orange[200]),
                    ),
                    Positioned(top: 7.5, child: image1),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
>>>>>>> e05bba0e00a1e43de592355c61a57c0d3f086e0c
