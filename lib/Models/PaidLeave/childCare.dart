import 'medical.dart';

class ChildCare extends Medical {
  final duration = 365 * 2;
  final isAppendable = false;
  final maxConsecutive = 15;
  int remainingDays = 15;
  bool leaveApplicable = false;
  int timesTaken = 3;
  bool reasonValid() {
    return null;
  }

  void leavesRemaining() {
    if (timesTaken <= 0)
      leaveApplicable = false;
    else
      leaveApplicable = true;
  }
}
