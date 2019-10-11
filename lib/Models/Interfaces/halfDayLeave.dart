import 'package:leave_management/Models/Interfaces/leave.dart';

class HalfDayLeave extends Leave {
  double leavesGranted(double duration) {
    if (isGranted(duration)) {
      return remainingLeaves - duration;
    } else {
      return remainingLeaves.toDouble();
    }
  }

  bool isGranted(double duration) {
    return applyLeave(duration.toInt());
  }
}
