import 'package:flutter/material.dart';
import 'package:leave_management/Screens/leaveDetails.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';

class PastLeaves extends StatefulWidget {
  @override
  _PastLeavesState createState() => _PastLeavesState();
}

class _PastLeavesState extends State<PastLeaves> {
  Widget listDetail(String type, String from, String to) {
    return Text(type + "\n" + "From :" + from + "\n" + "To :" + to);
  }

  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Past Leavse",
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: ListTile(
                  title: Text("Leave due to fever"),
                  subtitle: listDetail(
                      "Medical Leave", "October 10 ,2019", "October 25 ,2019"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LeaveDetails();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: ListTile(
                  title: Text("Leave for perosnal reason"),
                  subtitle: listDetail("Casual Leave", "September 14 ,2019",
                      "September 17 ,2019"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LeaveDetails();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: ListTile(
                  title: Text("Vacation"),
                  subtitle:
                      listDetail("Vacation", "May 12 ,2019", "June 25 ,2019"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LeaveDetails();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: ListTile(
                  title: Text("Leave due to cough and cold"),
                  subtitle: listDetail(
                      "Sick Leave", "April 15 ,2019", "April 16 ,2019"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LeaveDetails();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: ListTile(
                  title: Text("Child-care Leave"),
                  subtitle: listDetail(
                      "Child Care Leave", "March 4 ,2019", "March 24 ,2019"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LeaveDetails();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: ListTile(
                  title: Text("Paternity"),
                  subtitle: listDetail("Paternity Leave", "February 20 ,2019",
                      "February 28 ,2019"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LeaveDetails();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: ListTile(
                  title: Text("Leave due to Viral Fever"),
                  subtitle: listDetail(
                      "Medical Leave", "January 10 ,2019", "January 15 ,2019"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LeaveDetails();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: ListTile(
                  title: Text("Leave due to personal reason"),
                  subtitle: listDetail("Casual Leave", "December 20 ,2018",
                      "December 25 , 2018"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LeaveDetails();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
