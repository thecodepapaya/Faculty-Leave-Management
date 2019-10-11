import 'leave.dart';

abstract class Unpaid extends Leave {
  bool faculty;
  bool isAppendable;
  int duration;
  int maxConsecutive;
  int pastService;
}
