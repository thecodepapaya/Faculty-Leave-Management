import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';
import 'package:leave_management/Utils/houseKeeping.dart';
import 'package:pdf/widgets.dart' as leavePdf;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class LeaveDetails extends StatefulWidget {
  final DocumentSnapshot snapshot;
  LeaveDetails({@required this.snapshot});
  @override
  _LeaveDetailsState createState() => _LeaveDetailsState();
}

class _LeaveDetailsState extends State<LeaveDetails> {
  Widget cardBuilder(String title, String description) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
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
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
                      ),
                    ),
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
      body: SingleChildScrollView(
        child: leaveDetails(
          snapshot: widget.snapshot,
        ),
      ),
      floatingButton: FloatingActionButton(
        child: Icon(Icons.file_download),
        onPressed: () async {
          Printing.layoutPdf(
            onLayout: buildPdf,
          );
          // Directory appDocDir = await getApplicationDocumentsDirectory();
          // String appDocPath = appDocDir.path;
        },
      ),
    );
  }

  List<int> buildPdf(PdfPageFormat format) {
    leavePdf.Document doc = leavePdf.Document();

    doc.addPage(
      leavePdf.Page(
        pageFormat: format,
        clip: false,
        build: (leavePdf.Context context) {
          return leavePdf.Expanded(
            // constraints: leavePdf.BoxConstraints.expand(),
            // child: leavePdf.FittedBox(
            child: leavePdf.Column(
              crossAxisAlignment: leavePdf.CrossAxisAlignment.start,
              children: <leavePdf.Widget>[
                leavePdf.Container(
                  alignment: leavePdf.Alignment.center,
                  padding:
                      const leavePdf.EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
                  child: leavePdf.Text(
                    "Type: ${widget.snapshot.data["type"]}",
                    style: leavePdf.TextStyle(fontSize: 20),
                  ),
                ),
                leavePdf.Column(
                  crossAxisAlignment: leavePdf.CrossAxisAlignment.start,
                  mainAxisAlignment: leavePdf.MainAxisAlignment.start,
                  children: <leavePdf.Widget>[
                    leavePdf.Padding(
                      padding: const leavePdf.EdgeInsets.fromLTRB(
                          18.0, 10, 18.0, 10),
                      child: leavePdf.Text(
                        "From: ${widget.snapshot.data["name"]}",
                        style: leavePdf.TextStyle(fontSize: 11),
                      ),
                    ),
                    leavePdf.Padding(
                      padding: const leavePdf.EdgeInsets.fromLTRB(
                          18.0, 10, 18.0, 10),
                      child: leavePdf.Text(
                        "To: Director",
                        style: leavePdf.TextStyle(fontSize: 11),
                      ),
                    ),
                    leavePdf.Padding(
                      padding: const leavePdf.EdgeInsets.fromLTRB(
                          18.0, 10, 18.0, 10),
                      child: leavePdf.Text(
                        "Date: ${DateFormat("dd-MMM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(widget.snapshot.data["epochTime"])))}",
                        style: leavePdf.TextStyle(fontSize: 11),
                      ),
                    ),
                    leavePdf.Padding(
                      padding: const leavePdf.EdgeInsets.fromLTRB(
                          18.0, 10, 18.0, 10),
                      child: leavePdf.Text(
                        "Subject: ${widget.snapshot.data["subject"]}",
                        style: leavePdf.TextStyle(fontSize: 11),
                      ),
                    ),
                    leavePdf.Padding(
                      padding: const leavePdf.EdgeInsets.fromLTRB(
                          18.0, 10, 18.0, 10),
                      child: leavePdf.Text(
                        "${widget.snapshot.data["reason"]}",
                        textAlign: leavePdf.TextAlign.justify,
                        style: leavePdf.TextStyle(fontSize: 11),
                      ),
                    ),
                    leavePdf.Padding(
                      padding: const leavePdf.EdgeInsets.fromLTRB(
                          18.0, 10, 18.0, 10),
                      child: leavePdf.Text(
                        "From ${widget.snapshot.data["startDate"]}",
                        style: leavePdf.TextStyle(fontSize: 11),
                      ),
                    ),
                    leavePdf.Padding(
                      padding: const leavePdf.EdgeInsets.fromLTRB(
                          18.0, 10, 18.0, 10),
                      child: leavePdf.Text(
                        "To ${widget.snapshot.data["endDate"]}",
                        style: leavePdf.TextStyle(fontSize: 11),
                      ),
                    ),
                    leavePdf.Padding(
                      padding: const leavePdf.EdgeInsets.only(
                          left: 18.0, bottom: 10),
                      child: leavePdf.Container(
                        // decoration:
                        // leavePdf.BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                        padding: const leavePdf.EdgeInsets.fromLTRB(
                            18.0, 10, 18.0, 10),
                        child: leavePdf.Text(
                          "Sign of Applicant",
                          style: leavePdf.TextStyle(
                              color: PdfColors.black, fontSize: 11),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // ),
          );
        },
      ),
    );
    return doc.save();
  }

  Widget leaveDetails({@required DocumentSnapshot snapshot}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
          child: Text(
            "Type: ${snapshot.data["type"]}",
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
                "From: ${snapshot.data["name"]}",
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
                "Date: ${DateFormat("dd-MMM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(widget.snapshot.data["epochTime"])))}",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
              child: Text(
                "Subject: ${snapshot.data["subject"]}",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
              child: Text(
                "${snapshot.data["reason"]}",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
              child: Text(
                "From ${snapshot.data["startDate"]}",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
              child: Text(
                "To ${snapshot.data["endDate"]}",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 10),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                padding: const EdgeInsets.fromLTRB(18.0, 10, 18.0, 10),
                child: Text(
                  "Sign of Applicant",
                  style: TextStyle(color: Colors.black38, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
