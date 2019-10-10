import 'package:leave_management/Models/Interfaces/paid.dart';
import 'package:leave_management/Models/Interfaces/academicCalendar.dart';

class CasualLeave {
  final maxConsecutive = 5;
  final duration = 8;
  var remainingLeaves = 8;
  final isAppendable = false;
}
