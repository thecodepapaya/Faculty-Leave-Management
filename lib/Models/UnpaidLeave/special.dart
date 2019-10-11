import 'package:leave_management/Models/Interfaces/unpaid.dart';

class Special extends Unpaid {
  final faculty = true;
  // int remaining_leaves;
  var pastService = 365 * 3;
  final maxConsecutive = 365 * 3;
  String salary = "given";
  var duration = 365;
  final isAppendable = false;
}
