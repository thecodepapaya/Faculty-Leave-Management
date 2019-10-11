import 'package:leave_management/Models/Interfaces/gregorianCalendar.dart';
import 'package:leave_management/Models/Interfaces/leave.dart';

class Accumulatable extends Leave implements GregorianCalender {
  int maxAccumulatable;
  Accumulatable({this.maxAccumulatable});

  @override
  void calendarBegin() {}

  @override
  void calendarExpire() {}

  int accumulate(int overheadLeaves) {
    return (remainingLeaves + overheadLeaves) % maxAccumulatable;
  }
}
