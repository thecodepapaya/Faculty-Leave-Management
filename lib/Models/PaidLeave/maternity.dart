import 'medical.dart';

class Maternity extends Medical {
  final duration = 365 * 2;
  final isAppendable = true;
  final maxConsecutive = 180;
  int remainingLeaves = 180;
}
