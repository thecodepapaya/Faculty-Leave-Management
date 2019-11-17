import 'package:flutter/material.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';

class CurrentLeaveDetails extends StatefulWidget {
  @override
  _CurrentLeaveDetailsState createState() => _CurrentLeaveDetailsState();
}

class _CurrentLeaveDetailsState extends State<CurrentLeaveDetails> {
  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Leave Details",
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
              child: Text(
                "Type: Medical Leave",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
                  child: Text(
                    "From: Ashish Phophalia",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
                  child: Text(
                    "To: Director",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
                  child: Text(
                    "Date: 21/22/23",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
                  child: Text(
                    "Subject: Leave for Cold",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
                  child: Text(
                    "I want Leave djbasdkv vbnadbd vadn cas kas ckas as c asc as cas cas cas c ashc ash chas cas cka ca cas cnas cksa ckas cjkas c asc as ckas cas c asnc asn cnas cas nc asnc asnk cnkas cas nkc asnc nac asnkc askc asnk casnc ask casnkc asnk nc anks casnkc nkas cnkas cnkas cnas cnkas cnas cnkas c asnkc asnk ckasnc asnkc asnk casnkc asnkc asnkc ank ankc ankc asnkc asnk casnk casnkc nkas cnkas casnk cnas cnasc asnkc asnkc nas c askc asnc kasc asnk casnk casn cnkas cnkas cnkas c",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
                  child: Text(
                    "From 1/2/3",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
                  child: Text(
                    "To 4/5/6",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid)),
                    padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
                    child: Text(
                      "Sign of Applicant",
                      style: TextStyle(color: Colors.black38, fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 120,
                  child: FlatButton(
                    child: Text("Approve"),
                    onPressed: () {},
                    color: Colors.green,
                  ),
                ),
                Container(
                  width: 120,
                  child: FlatButton(
                    child: Text("Disapprove"),
                    onPressed: () {},
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
            ),
          ],
        ),
      ),
      floatingButton: FloatingActionButton(
        child: Icon(Icons.file_download),
        onPressed: () {},
      ),
    );
  }
}
