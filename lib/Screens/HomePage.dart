import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:leave_management/Screens/lform.dart';
import 'package:shimmer/shimmer.dart';
import 'package:leave_management/Screens/pendingApproval.dart';
import 'package:leave_management/Screens/pastLeaves.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;
  HomePage({@required this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // UserAccountsDrawerHeader(
            //   accountEmail: Text(widget.user.email),
            //   accountName: Text(widget.user.displayName),
            //   currentAccountPicture: CircleAvatar(
            //     backgroundImage: NetworkImage(widget.user.photoUrl),
            //   ),
            // ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.user.photoUrl),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.user.displayName),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.user.email),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                title: Text("Pending Approval"),
                subtitle: Text("Check leaves which are pending approval"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return PendingApproval();
                    }),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Past Leaves"),
                subtitle: Text("Check past leaves record"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return PastLeaves();
                    }),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Check Remaining Leaves"),
                subtitle: Text("Check leaves which are pending approval"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return LeaveForm();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
