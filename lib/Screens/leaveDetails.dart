import 'package:flutter/material.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';
import 'package:leave_management/Utils/houseKeeping.dart';

class LeaveDetails extends StatefulWidget {
  final String title;
  final String reason;
  final String fromDate;
  final String toDate;
  LeaveDetails({
    @required this.reason,
    @required this.title,
    @required this.fromDate,
    @required this.toDate,
  });
  @override
  _LeaveDetailsState createState() => _LeaveDetailsState();
}

class _LeaveDetailsState extends State<LeaveDetails> {
  Widget cardBuilder(String title, String description) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        // color: HouseKeeping.randomColor(density: 100),
        child: Container(
          height: 130,
          width: 450,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SingleChildScrollView(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        description,
                        style: TextStyle(fontSize: 15),
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
        // shape:
        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Leave Details",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  cardBuilder("Reason", widget.reason),
                  cardBuilder("From", widget.fromDate),
                  cardBuilder("To", widget.toDate),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.file_download),
      ),
    );
  }
}
