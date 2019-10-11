import 'package:leave_management/Models/Interfaces/paid.dart';

class Encashable extends Paid {
  bool isEligible() {
    return true;
  }

  int encashLeaves(int duration) {
    return duration * payGrade;
  }
}
