import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    'Casual',
    'ChildCare',
    'Maternity',
    'Medical',
    'Paternity',
    'HalfPaid',
    'FullPaid',
    'SpecialCasual',
    'Vacation',
    'ExtraOrdinary',
    'LeaveNotDue',
    'Lien',
    'Sabbatical',
    'Special'
  ];

  TextEditingController _reasonController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  final format = DateFormat("dd-MMM-yyyy");
  DateTime startDateTime;

  @override
  Widget build(BuildContext context) {
    return LeaveScaffold(
      title: "Leave Form",
      floatingButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
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
                      child: Text(
                        "Proceed",
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: Colors.blue,
                      onPressed: () async {
                        var document = await Firestore.instance
                            .collection("${GlobalVariables.user.email}")
                            .document("$_leaveType")
                            .get();
                        print("=============================");
                        print("${GlobalVariables.user.email}");
                        print("$_leaveType");
                        print(document.data);
                        int count = document.data["remaining"];
                        if (document.data["remaining"] == 0) {
                          print("No Leave left");
                        } else {
                          await Firestore.instance
                              .collection("${GlobalVariables.user.email}")
                              .document("$_leaveType")
                              .setData({"remaining": count - 1}, merge: true);
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
                            "photoUrl": GlobalVariables.user.photoUrl,
                          }).then((onValue) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          });
                        }
                      },
                    ),
                  ],
                );
              },
            );
          }
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
                validator: (String value) {
                  if (value == null) {
                    return "Cannot be empty";
                  } else if (value.isEmpty || value == '') {
                    return "Cannot be empty";
                  } else {
                    return null;
                  }
                },
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
                            // if (newValue == "") {}
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
                inputFormatters: [
                  BlacklistingTextInputFormatter(
                    RegExp("[\/\*]"),
                  ),
                ],
                decoration: const InputDecoration(
                  icon: const Icon(Icons.note_add),
                  hintText: 'Enter Subject',
                  labelText: 'Subject',
                ),
                maxLines: 2,
                maxLength: 50,
                validator: (String val) {
                  if (val.isEmpty) {
                    return "Subject cannot be empty";
                  } else
                    return null;
                },
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
                onChanged: (value) {
                  startDateTime = value;
                  print("Current val: $value");
                },
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
                decoration: const InputDecoration(
                  icon: const Icon(Icons.date_range),
                  hintText: 'Enter Start Date',
                  labelText: 'Starting date',
                ),
                validator: (value) {
                  if (value == null) {
                    return "Enter start date";
                  } else if (value.isBefore(DateTime.now()))
                    return "Leaves cannot be in past";
                  else
                    return null;
                },
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
                  hintText: 'Enter Ending Date',
                  labelText: 'Ending date',
                ),
                validator: (value) {
                  if (value == null) {
                    return "Enter Ending date";
                  } else if (startDateTime == null) {
                    return "Please enter start date";
                  } else if (value.isBefore(DateTime.now())) {
                    return "Leaves cannot be in Past";
                  } else if (value.isBefore(startDateTime)) {
                    return "Invalid Date range";
                  } else
                    return null;
                },
              ),
              TextFormField(
                controller: _reasonController,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Reason cannot be Empty";
                  } else
                    return null;
                },
                inputFormatters: [
                  BlacklistingTextInputFormatter(
                    RegExp("[\/\*]"),
                  ),
                ],
                decoration: const InputDecoration(
                  icon: const Icon(Icons.speaker_notes),
                  hintText: 'Enter Reason',
                  labelText: 'Reason',
                ),
                maxLines: null,
                maxLength: 500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
