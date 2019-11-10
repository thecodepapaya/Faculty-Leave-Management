import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leave_management/Models/PaidLeave/casualLeave.dart';

class Faculty {
  String name;
  String emailID;
  Timestamp joiningDate;
  CasualLeave _casualLeave;
  Faculty();
}
