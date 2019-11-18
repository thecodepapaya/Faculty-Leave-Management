import 'package:leave_management/Models/Interfaces/leave.dart';

abstract class Unpaid extends Leave {
  Unpaid() {
    dailyPay = 0;
  }
}
