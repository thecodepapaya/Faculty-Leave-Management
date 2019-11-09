import 'package:leave_management/Models/Interfaces/Unpaid.dart';

class Extraordinary extends Unpaid {
  // int remaining_leaves;
  int pastService = 0;
  int maxConsecutive = 12; //any random number
  int duration = 12; //RANDOM NUMBER
  bool isAppendable = false;
  bool allLeaExhausted = true;
  bool faculty = true;
  bool benefitsgiven = false;
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
