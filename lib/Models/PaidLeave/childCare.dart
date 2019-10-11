import 'package:leave_management/Models/Interfaces/paid.dart';

class ChildCare extends Paid {
  final duration = 365 * 2;
  final isAppendable = false;
  final maxConsecutive = 15;
  int remainingLeaves = 15;
  bool leaveApplicable = false;
  void reason() {}
}
