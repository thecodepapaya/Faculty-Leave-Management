import 'package:leave_management/Models/Interfaces/paid.dart';
import 'package:leave_management/Models/Interfaces/academicCalendar.dart';

class CasualLeave extends Paid implements AcademicCalendar {
  final maxConsecutive = 5;
  final duration = 8;
  var remainingLeaves = 8;
  final isAppendable = false;

  @override
  String enddate;

  @override
  String startdate;

  @override
  void calendarBegin() {
    // TODO: implement calendarBegin
  }

  @override
  void calendarExpire() {
    // TODO: implement calendarExpire
  }
}
