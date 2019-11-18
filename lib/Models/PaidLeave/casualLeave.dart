import 'package:leave_management/Models/Interfaces/paid.dart';
import 'package:leave_management/Models/Interfaces/academicCalendar.dart';

class CasualLeave extends Paid implements AcademicCalendar {
  final maxConsecutive = 5;
  final duration = 8;
  int remainingLeaves = 8;
  final isAppendable = false;

  String endDate;

  String startDate;

  @override
  void calendarBegin() {
  }

  @override
  void calendarExpire() {
  }
}
