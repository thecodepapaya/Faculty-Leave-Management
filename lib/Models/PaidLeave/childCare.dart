import 'medical.dart';

class ChildCare extends Medical {
  final duration = 365 * 2;
  final isAppendable = false;
  final maxConsecutive = 15;
  int remainingLeaves = 15;
  bool leaveApplicable = false;
  bool reasonValid() {
    return null;
  }
}
