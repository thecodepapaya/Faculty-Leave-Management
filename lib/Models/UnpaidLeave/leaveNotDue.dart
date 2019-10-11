import 'package:leave_management/Models/Interfaces/unpaid.dart';

class Leavenotdue extends Unpaid {
  final faculty = true;
  // bool benefitsgiven = false;
  int remainingLeaves;
  int pastService = 0;
  String salary = "givenhalf";
  final maxConsecutive = 12; //any random number
  int duration = 12; //RANDOM NUMBER
  final isAppendable = false;
  bool allLeaveExhausted = true;
  bool applyLeave(int duration) {
    if ((duration > maxContiguousPossibleDuration) || (remainingLeaves != 0))
      return false;
    else
      return true;
  }
}
