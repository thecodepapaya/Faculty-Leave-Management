import 'package:leave_management/Models/Interfaces/Unpaid.dart';

class sabattial extends Unpaid {
  final faculty = true;
  // int remaining_leaves;
  var past_service = 365 * 6;
  var maxConsecutive = 365 * 1;
  String salary = "given";
  var duration = 365;
  final isAppendable = true;
  int appendable = 120;
}
