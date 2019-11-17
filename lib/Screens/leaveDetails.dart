import 'package:flutter/material.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';
import 'package:leave_management/Utils/houseKeeping.dart';
import 'package:pdf/widgets.dart' as leavePdf;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

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
      body: SingleChildScrollView(
        child: leaveDetails(),
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
                    "Type: Medical Leave",
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
                        "From: Ashish Phophalia",
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
                        "Date: 21/22/23",
                        style: leavePdf.TextStyle(fontSize: 11),
                      ),
                    ),
                    leavePdf.Padding(
                      padding: const leavePdf.EdgeInsets.fromLTRB(
                          18.0, 10, 18.0, 10),
                      child: leavePdf.Text(
                        "Subject: Leave for Cold",
                        style: leavePdf.TextStyle(fontSize: 11),
                      ),
                    ),
                    leavePdf.Padding(
                      padding: const leavePdf.EdgeInsets.fromLTRB(
                          18.0, 10, 18.0, 10),
                      child: leavePdf.Text(
                        "I want Leave djbasdkv vbnadbd vadn cas kas ckas as c asc as cas"
                        " ckas cjkas c asc as ckas cas c asnc asn cnas cas nc asnc asnk cnkas cas nkc asnc nac "
                        " ckas cjkas c asc as ckas cas c asnc asn cnas cas nc asnc asnk cnkas cas nkc asnc nac "
                        " ckas cjkas c asc as ckas cas c asnc asn cnas cas nc asnc asnk cnkas cas nkc asnc nac ",
                        textAlign: leavePdf.TextAlign.justify,
                        style: leavePdf.TextStyle(fontSize: 11),
                      ),
                    ),
                    leavePdf.Padding(
                      padding: const leavePdf.EdgeInsets.fromLTRB(
                          18.0, 10, 18.0, 10),
                      child: leavePdf.Text(
                        "From 1/2/3",
                        style: leavePdf.TextStyle(fontSize: 11),
                      ),
                    ),
                    leavePdf.Padding(
                      padding: const leavePdf.EdgeInsets.fromLTRB(
                          18.0, 10, 18.0, 10),
                      child: leavePdf.Text(
                        "To 4/5/6",
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

    // doc.addPage(
    //   leavePdf.Page(
    //     pageFormat: format,
    //     build: (pdf.Context context) {
    //       return pdf.ConstrainedBox(
    //         constraints: const pdf.BoxConstraints.expand(),
    //         child: pdf.FittedBox(
    //           child: pdf.Text(
    //             'Hello World',
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );

    // final leavePdf.Document pdf = leavePdf.Document();
    // final Directory output = await getApplicationDocumentsDirectory();
    // final File file = File("${output.path}/leave.pdf");
    // // final file = File("example.pdf");
    // await file.writeAsBytes(pdf.save());
    // print("File saved at :${output.path}/leave.pdf");

    return doc.save();
  }

  Widget leaveDetails() {
    return Column(
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
                "I want Leave djbasdkv vbnadbd vadn cas kas ckas as c asc as cas"
                " cas cas c ashc ash chas cas cka ca cas cnas cksa"
                " ckas cjkas c asc as ckas cas c asnc asn cnas cas nc asnc asnk cnkas cas nkc asnc nac "
                "asnkc askc asnk casnc ask casnkc asnk nc anks casnkc nkas cnkas cnkas cnas cnkas cnas "
                "cnkas c asnkc asnk ckasnc asnkc asnk casnkc asnkc asnkc ank ankc ankc asnkc asnk casnk "
                "casnkc nkas cnkas casnk cnas cnasc asnkc asnkc nas c askc asnc kasc "
                "asnk casnk casn cnkas cnkas cnkas c",
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
