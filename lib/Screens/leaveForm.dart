import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:leave_management/Utils/LeaveScaffold.dart';
import 'package:intl/intl.dart';
import 'package:leave_management/Utils/GlobalVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LeaveForm extends StatefulWidget {
  @override
  _LeaveFormState createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _leaveType = ' ';
  List<String> _leavesList = <String>[
    ' ',
    GlobalVariables.casualLeave,
    GlobalVariables.childCare,
    GlobalVariables.maternity,
    GlobalVariables.medical,
    GlobalVariables.paternity,
    GlobalVariables.halfPaid,
    GlobalVariables.fullPaid,
    GlobalVariables.specialCasual,
    GlobalVariables.vacation,
    GlobalVariables.extraOrdinary,
    GlobalVariables.leaveNotDue,
    GlobalVariables.lien,
    GlobalVariables.sabbatical,
    GlobalVariables.special,
  ];

  TextEditingController _reasonController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  final format = DateFormat("dd-MMM-yyyy");

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
                    onPressed: () async {
                      String epochTime =
                          DateTime.now().millisecondsSinceEpoch.toString();
                      await Firestore.instance
                          .collection("admin")
                          .document(
                              "${GlobalVariables.user.email} " + epochTime)
                          .setData({
                        "reason": _reasonController.text,
                        "subject": _subjectController.text,
                        "startDate": _startDateController.text,
                        "endDate": _endDateController.text,
                        "name": GlobalVariables.user.displayName,
                        "type": _leaveType,
                        "isChecked": false,
                        "isGranted": false,
                        "epochTime": epochTime,
                        "email": GlobalVariables.user.email,
                        "photoUrl": GlobalVariables.user.phoneNumber,
                      }).then((onValue) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                    },
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
              new FormField(
                builder: (FormFieldState state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.home),
                      labelText: 'Leaves',
                    ),
                    isEmpty: _leaveType == ' ',
                    child: new DropdownButtonHideUnderline(
                      child: new DropdownButton(
                        hint: Text("Select Leaves"),
                        value: _leaveType,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _leaveType = newValue;
                            state.didChange(newValue);
                          });
                        },
                        items: _leavesList.map((String value) {
                          return new DropdownMenuItem(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
              TextFormField(
                controller: _subjectController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.note_add),
                  hintText: 'Enter Subject',
                  labelText: 'Subject',
                ),
              ),
              // TextFormField(
              //   controller: _startDateController,
              //   decoration: const InputDecoration(
              //     icon: const Icon(Icons.date_range),
              //     hintText: 'Enter Start Date',
              //     labelText: 'Starting date',
              //   ),
              //   keyboardType: TextInputType.datetime,
              // ),
              DateTimeField(
                controller: _startDateController,
                format: DateFormat("dd-MMM-yyyy"),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
                decoration: const InputDecoration(
                  icon: const Icon(Icons.date_range),
                  hintText: 'Enter Start Date',
                  labelText: 'Starting date',
                ),
              ),
              // TextFormField(
              //   controller: _endDateController,
              //   decoration: const InputDecoration(
              //     icon: const Icon(Icons.date_range),
              //     hintText: 'Enter End Date',
              //     labelText: 'Ending date',
              //   ),
              //   keyboardType: TextInputType.datetime,
              // ),
              DateTimeField(
                controller: _endDateController,
                format: DateFormat("dd-MMM-yyyy"),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
                decoration: const InputDecoration(
                  icon: const Icon(Icons.date_range),
                  hintText: 'Enter Start Date',
                  labelText: 'Starting date',
                ),
              ),
              TextFormField(
                controller: _reasonController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.speaker_notes),
                  hintText: 'Enter Reason',
                  labelText: 'Reason',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
