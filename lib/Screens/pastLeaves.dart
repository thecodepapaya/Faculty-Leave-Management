import 'package:flutter/material.dart';
import 'package:leave_management/Screens/leaveDetails.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';

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
    String title,
    String type,
    String from,
    String to,
    Color clr,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        // color: HouseKeeping.randomColor(density: 100),
        color: clr,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 130,
            width: 450,
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(fontSize: 25),
              ),
              subtitle: listDetail(type, from, to),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return LeaveDetails(
                        title: type,
                        reason: title,
                        fromDate: from,
                        toDate: to,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Past Leaves",
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              cardBuilder("Leave due to cough and cold", "Medical Leave",
                  "October 15 ,2019", "October 17 ,2019", Colors.red[300]),
              cardBuilder("Leave for personal reason", "Casual Leave",
                  "September 14 ,2019", "September 17 ,2019", Colors.blue[300]),
              cardBuilder("Vacation", "Vacation", "May 12 ,2019",
                  "June 25 ,2019", Colors.amber[200]),
              cardBuilder("Leave due to cough and cold", "Sick Leave",
                  "April 15 ,2019", "April 16 ,2019", Colors.red[300]),
              cardBuilder("Child-care Leave", "Child Care Leave",
                  "March 4 ,2019", "March 24 ,2019", Colors.deepPurple[200]),
              cardBuilder("Paternity", "Paternity Leave", "February 20 ,2019",
                  "February 28 ,2019", Colors.lightGreen[200]),
              cardBuilder("Leave due to Viral Fever", "Medical Leave",
                  "January 10 ,2019", "January 15 ,2019", Colors.red[300]),
              cardBuilder("Leave due to personal reason", "Casual Leave",
                  "December 20 ,2018", "December 25 , 2018", Colors.blue[300]),
            ],
          ),
          // decoration: BoxDecoration(color: Colors.blue[100]),
          // width: MediaQuery.of(context).size.width * 1.0,
        ),
      ),
    );
  }
}
