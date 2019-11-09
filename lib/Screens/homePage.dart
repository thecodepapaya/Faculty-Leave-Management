import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:leave_management/Screens/leaveForm.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';
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
    return !widget.user.email.endsWith("@iiitvadodara.ac.in")
        ? notAllowedScreen()
        : LeaveScaffold(
            title: "Home page",
            body: SingleChildScrollView(
              //check if the logged in user has used institute email id
              //if they have not used institute email ID, show a "not allowed" dialog box
              //otherwise let everything work the way it should
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
            floatingButton: FloatingActionButton(
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

  Widget notAllowedScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error 405"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Oh no! It looks like you are not allowed to use this service.\n Try switching account.",
                textAlign: TextAlign.center,
                textScaleFactor: 1.2,
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  await GoogleSignIn().signOut();
                },
                child: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
