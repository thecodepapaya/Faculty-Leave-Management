import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:leave_management/Screens/leaveForm.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';
import 'package:leave_management/Utils/houseKeeping.dart';
import 'package:leave_management/Screens/pendingApproval.dart';
import 'package:leave_management/Screens/pastLeaves.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;
  HomePage({@required this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController controller1, controller2, controller3;
  Animation animation1, animation2, animation3;

  @override
  void initState() {
    super.initState();
    HouseKeeping.updateLastSeen(emailId: widget.user.email);

    controller1 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller3 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation1 = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller1);
    animation2 = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller1);
    animation3 = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller1);
    Timer(Duration(milliseconds: 0), () {
      controller1.forward();
    });
    Timer(Duration(milliseconds: 300), () {
      controller2.forward();
    });
    Timer(Duration(milliseconds: 600), () {
      controller3.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return !widget.user.email.endsWith("@iiitvadodara.ac.in")
        ? notAllowedScreen()
        : LeaveScaffold(
            title: "Home page",
            body: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(150.0, 50.0),
                    bottomRight: Radius.elliptical(150.0, 50.0),
                  ),
                  child: Image(
                    width: double.infinity,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/image.png'),
                  ),
                ),
                // Image.asset('assets/images/green.jpg',),
                SingleChildScrollView(
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
                            padding: const EdgeInsets.all(20.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(widget.user.photoUrl),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.user.displayName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    // fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.user.email,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: FadeTransition(
                          // controller.forward(),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              title: Text("Pending Approval"),
                              subtitle: Text(
                                  "Check leaves which are pending approval"),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return PendingApproval();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          opacity: animation1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: FadeTransition(
                          opacity: animation2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              title: Text("Past Leaves"),
                              subtitle: Text("Check past leaves record"),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return PastLeaves();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: FadeTransition(
                          opacity: animation3,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              title: Text("Check Remaining Leaves"),
                              subtitle: Text(
                                  "Check leaves which are pending approval"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
