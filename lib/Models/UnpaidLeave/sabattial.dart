import 'package:leave_management/Models/Interfaces/Unpaid.dart';

class Sabattial extends Unpaid {
  final faculty = true;
  // int remaining_leaves;
  var pastService;
  var maxConsecutive = 365 * 1;
  String salary = "given";
  var duration = 365;
  final isAppendable = true;
  int appendable = 120;
  bool applyLeave(int duration) {
    if ((duration > maxContiguousPossibleDuration) || (pastService < 365 * 6))
      return false;
    else
      return true;
  }
}
