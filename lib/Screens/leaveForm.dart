import 'package:flutter/material.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';

class LeaveForm extends StatefulWidget {
  @override
  _LeaveFormState createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _addresseeNameController = TextEditingController();
  TextEditingController _purposeController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Leave Form",
      floatingButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Submit"),
                content: Text(
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
              );
            },
          );
        },
        tooltip: "Submit",
        child: Icon(Icons.send),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              TextFormField(
                controller: _addresseeNameController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Enter addressee name',
                  labelText: 'To',
                ),
              ),
              TextFormField(
                controller: _purposeController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.note_add),
                  hintText: 'Enter a Purpose',
                  labelText: 'Subject',
                ),
              ),
              TextFormField(
                controller: _startDateController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.date_range),
                  hintText: 'Enter Start Date',
                  labelText: 'Starting date',
                ),
                keyboardType: TextInputType.datetime,
              ),
              TextFormField(
                controller: _endDateController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.date_range),
                  hintText: 'Enter End Date',
                  labelText: 'Ending date',
                ),
                keyboardType: TextInputType.datetime,
              ),
              TextFormField(
                controller: _purposeController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.adjust),
                  hintText: 'Enter a Purpose',
                  labelText: 'Purpose',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
