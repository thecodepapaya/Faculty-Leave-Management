import 'package:flutter/material.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';

import 'currentLeaveDetails.dart';

class CurrentApplications extends StatefulWidget {
  @override
  _CurrentApplicationsState createState() => _CurrentApplicationsState();
}

class _CurrentApplicationsState extends State<CurrentApplications> {
  Widget cardBuilder(String name, String reason) {
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
                  backgroundImage: AssetImage(
                    "assets/images/image.png",
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
      body: GridView.count(
        crossAxisCount: 2,
        children: List<Widget>.generate(16, (index) {
          return GridTile(child: cardBuilder("name", "reason"));
        }),
      ),
    );
  }
}
