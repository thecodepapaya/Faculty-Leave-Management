import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leave_management/Models/PaidLeave/casualLeave.dart';
import 'package:leave_management/Models/PaidLeave/childCare.dart';
import 'package:leave_management/Models/PaidLeave/maternity.dart';
import 'package:leave_management/Models/PaidLeave/paternity.dart';
import 'package:leave_management/Models/PaidLeave/specialCasual.dart';
import 'package:leave_management/Models/PaidLeave/vacation.dart';

class Faculty {
  String name;
  String emailID;
  Timestamp joiningDate;
  CasualLeave _casualLeave;
  SpecialCasual _specialCasualLeave;
  Vacation _vacation;
  ChildCare _childcareLeave;
  Maternity _maternity;
  Paternity _paternity;
  Faculty() {
    _casualLeave = CasualLeave();
    _specialCasualLeave = SpecialCasual();
    _vacation = Vacation();
    _childcareLeave = ChildCare();
    _maternity = Maternity();
    _paternity = Paternity();
  }
}
