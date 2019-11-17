import 'package:flutter/material.dart';

class PendingApproval extends StatefulWidget {
  @override
  _PendingApprovalState createState() => _PendingApprovalState();
}

class _PendingApprovalState extends State<PendingApproval> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      appBar: AppBar(
        title: Text("Pending Approvals"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Medical Leave"),
            subtitle: Text("For High Fever"),
          ),
          ListTile(
            title: Text("Casual Leave"),
          ),
          ListTile(
            title: Text("Full Pay Leave"),
          ),
          ListTile(
            title: Text("Child Care"),
            subtitle: Text("For 12th Boards"),
          )
        ],
=======
    return LeaveScaffold(
      title: "Pending Approvals",
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  title: Text("Medical Leave"),
                  subtitle: Text("For High Fever"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                // shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text(
                      "C",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  title: Text("Casual Leave"),
                  subtitle: Text("Leave no.: 5"),
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
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                child: ListTile(
                  leading: Container(
                      height: 50,
                      width: 50,
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.attach_money,
                        size: 26,
                        color: Colors.white,
                      )),
                  title: Text("Full Pay Leave"),
                  subtitle: Text("Leave no.: 3"),
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
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    color: Colors.brown,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.child_care,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  title: Text("Child Care"),
                  subtitle: Text("For 12th Boards"),
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
            )
          ],
        ),
>>>>>>> aeb7f17418d3c9bf1b918935e424286568c61e98
      ),
    );
  }
}
