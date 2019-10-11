import 'package:leave_management/Models/Interfaces/paid.dart';

class Maternity extends Paid {
  final duration = 365 * 2;
  final isAppendable = true;
  final maxConsecutive = 180;
  var remainingLeaves = 180;
}
