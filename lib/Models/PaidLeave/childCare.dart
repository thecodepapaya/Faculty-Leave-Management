import 'package:leave_management/Models/Interfaces/paid.dart';

class ChildCare extends Paid {
  final duration = 365 * 2;
  final isAppendable = false;
  final maxConsecutive = 15;
  var remainingLeaves = 15;
  var leaveApplicable = false;
  void reason() {}
}
