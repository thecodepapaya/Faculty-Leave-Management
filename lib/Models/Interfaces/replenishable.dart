import 'package:leave_management/Models/Interfaces/academicCalendar.dart';
import 'package:leave_management/Models/Interfaces/leave.dart';

class Replenishable extends Leave implements AcademicCalendar {
  int replenishAmount;

  @override
  void calendarBegin() {
    remainingLeaves = remainingLeaves + replenishAmount;
  }

  @override
  void calendarExpire() {
    remainingLeaves = 0;
  }
}
