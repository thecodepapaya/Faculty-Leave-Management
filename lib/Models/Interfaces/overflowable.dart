import 'package:leave_management/Models/Interfaces/accumulatable.dart';

class Overflowable extends Accumulatable {
  int overheadLeaves;

  @override
  void calendarBegin() {
    remainingLeaves = remainingLeaves + overheadLeaves;
  }

  @override
  void calendarExpire() {
    remainingLeaves = remainingLeaves % maxAccumulatable;
  }
}
