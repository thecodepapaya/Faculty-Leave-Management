import 'package:leave_management/Models/Interfaces/unpaid.dart';

class Extraordinary extends Unpaid {
  final faculty = true;
  bool benefitsgiven = false;
  // int remaining_leaves;
  var pastService = 0;
  final maxConsecutive = 12; //any random number
  var duration = 12; //RANDOM NUMBER
  final isAppendable = false;
  bool allLeaExhausted = true;
  String dPermission;
  bool checkp() {
    if (dPermission == "given")
      return true;
    else
      return false;
  }

  @override
  bool applyLeave(int duration) {
    if ((duration > maxContiguousPossibleDuration) || (checkp() == false))
      return false;
    else
      return true;
  }
}
