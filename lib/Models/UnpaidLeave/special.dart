import 'package:leave_management/Models/Interfaces/Unpaid.dart';

class Special extends Unpaid {
  final faculty = true;
  // int remaining_leaves;
  var pastService;
  final maxConsecutive = 365 * 3;
  String salary = "given";
  var duration;
  final isAppendable = false;
  bool applyLeave(int duration) {
    if ((duration > maxContiguousPossibleDuration) || pastService < 3)
      return false;
    else
      return true;
  }
}
