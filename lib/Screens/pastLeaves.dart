import 'package:flutter/material.dart';

class PastLeaves extends StatefulWidget {
  @override
  _PastLeavesState createState() => _PastLeavesState();
}

class _PastLeavesState extends State<PastLeaves> {
  Widget listtitle(String title) {
    return Text(title);
  }

  Widget listdetail(String type, String from, String to) {
    return Text(type + "\n" + "From :" + from + "\n" + "To :" + to);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PastLeaves"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: listtitle("Leave due to fever"),
              subtitle: listdetail(
                  "Medical Leave", "October 10 ,2019", "October 25 ,2019"),
            ),
            ListTile(
              title: listtitle("Leave for perosnal reason"),
              subtitle: listdetail(
                  "Casual Leave", "September 14 ,2019", "September 17 ,2019"),
            ),
            ListTile(
              title: listtitle("Vacation"),
              subtitle: listdetail("Vacation", "May 12 ,2019", "June 25 ,2019"),
            ),
            ListTile(
              title: listtitle("Leave due to cough and cold"),
              subtitle:
                  listdetail("Sick Leave", "April 15 ,2019", "April 16 ,2019"),
            ),
            ListTile(
              title: listtitle("Child-care Leave"),
              subtitle: listdetail(
                  "Child Care Leave", "March 4 ,2019", "March 24 ,2019"),
            ),
            ListTile(
              title: listtitle("Paternity"),
              subtitle: listdetail(
                  "Paternity Leave", "February 20 ,2019", "February 28 ,2019"),
            ),
            ListTile(
              title: listtitle("Leave due to Viral Fever"),
              subtitle: listdetail(
                  "Medical Leave", "January 10 ,2019", "January 15 ,2019"),
            ),
            ListTile(
              title: listtitle("Leave due to personal reason"),
              subtitle: listdetail(
                  "Casual Leave", "December 20 ,2018", "December 25 , 2018"),
            ),
          ],
        ),
      ),
    );
  }
}
