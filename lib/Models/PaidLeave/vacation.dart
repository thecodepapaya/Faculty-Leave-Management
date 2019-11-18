import 'package:leave_management/Models/Interfaces/paid.dart';

class Vacation extends Paid {
  bool faculty = true;
  int duration = 60;
  int remainingLeaves;
  bool convertToEarned() {
    if (remainingLeaves > 0)
      return true;
    else
      return false;
  }

  void lateJoined(int daysLeft) {
    remainingLeaves = ((daysLeft / 365) * duration) as int;
  }
}
