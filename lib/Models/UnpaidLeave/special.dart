import 'package:leave_management/Models/Interfaces/Unpaid.dart';

class special extends Unpaid {
  final faculty = true;
  // int remaining_leaves;
  var past_service = 365 * 3;
  final maxConsecutive = 365 * 3;
  String salary = "given";
  var duration = 365;
  final isAppendable = false;
}
