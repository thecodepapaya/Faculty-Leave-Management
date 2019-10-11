import 'package:leave_management/Models/Interfaces/unpaid.dart';

class Leavenotdue extends Unpaid {
  final faculty = true;
  // bool benefitsgiven = false;
  int remainingLeaves = 0;
  var pastService = 0;
  String salary = "givenhalf";
  final maxConsecutive = 12; //any random number
  var duration = 12; //RANDOM NUMBER
  final isAppendable = false;
  bool allLeaveExhausted = true;
}
