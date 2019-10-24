import 'package:leave_management/Models/Interfaces/leave.dart';

class FixedPeriod extends Leave {
  DateTime dateTime;
  FixedPeriod({this.dateTime});
  bool isAvailable(DateTime requestedPeriod) {
    if (dateTime.compareTo(requestedPeriod) == 0) {
      return true;
    } else {
      return false;
    }
  }
}
