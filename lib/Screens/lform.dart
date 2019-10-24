// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cmms/utils/Mandi.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';
// import 'package:cmms/utils/mandiScaffold.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class lform extends StatefulWidget {
  @override
  _lformState createState() => _lformState();
}

class _lformState extends State<lform> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _sdatecontroller = TextEditingController();
  TextEditingController _edatecontroller = TextEditingController();

  // FirebaseAuth _auth;
  // FirebaseUser user;
  // UserUpdateInfo userInfo;

  // @override
  // void initState() {
  //   super.initState();
  //   _auth = FirebaseAuth.instance;
  //   userInfo = UserUpdateInfo();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leave Form"),
      ),
      // isClickable: false,
      // title: "Trader Form",
      floatingActionButton: new FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              child: new AlertDialog(
                title: new Text("Submit"),
                content: new Text(
                    "Please check your details. After proceeding you will not be able to edit your details."),
                actions: <Widget>[
                  FlatButton(
                    textColor: Colors.blue,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  FlatButton(
                    textColor: Colors.blue,
                    onPressed: () {},
                    child: Text(
                      "Proceed",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          },
          tooltip: "submit",
          label: Text("Submit")),
      body: new Container(
        child: new Form(
          key: _formKey,
          autovalidate: true,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              new TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your first and last name',
                  labelText: 'Name',
                ),
              ),
              new TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.adjust),
                  hintText: 'Enter a Purpose',
                  labelText: 'Purpose',
                ),
              ),
              new TextFormField(
                controller: _sdatecontroller,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.date_range),
                  hintText: 'Enter Start Date',
                  labelText: 'Starting date',
                ),
                keyboardType: TextInputType.datetime,
              ),
              new TextFormField(
                controller: _edatecontroller,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.date_range),
                  hintText: 'Enter End Date',
                  labelText: 'Ending date',
                ),
                keyboardType: TextInputType.datetime,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
