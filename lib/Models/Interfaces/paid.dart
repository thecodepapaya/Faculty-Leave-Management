import 'package:leave_management/Models/Interfaces/leave.dart';

class Paid extends Leave {
  bool isAppendable;
  int payGrade;

  Paid() {
    dailyPay = 10;
  }
}
