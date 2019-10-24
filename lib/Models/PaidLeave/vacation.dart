import 'package:leave_management/Models/Interfaces/paid.dart';

class Vacation extends Paid {
  bool faculty = true;
  int duration = 60;
  int remainingLeaves;
  int convertToEarned() {
    return null;
  }
}
