import 'package:leave_management/Models/Interfaces/Unpaid.dart';

class leavenotdue extends Unpaid {
  final faculty = true;
  // bool benefitsgiven = false;
  int remaining_leaves = 0;
  var past_service = 0;
  String salary = "givenhalf";
  final maxConsecutive = 12; //any random number
  var duration = 12; //RANDOM NUMBER
  final isAppendable = false;
  bool all_leave_exhausted = true;
}
