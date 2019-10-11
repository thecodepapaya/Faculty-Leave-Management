import 'package:leave_management/Models/Interfaces/paid.dart';

class Vacation extends Paid {
  final faculty = true;
  var remainingLeaves;
  final duration = 60;
  int convertToEarned() {
    return null;
  }
}
