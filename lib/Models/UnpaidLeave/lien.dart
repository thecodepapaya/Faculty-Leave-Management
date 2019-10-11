import 'package:leave_management/Models/Interfaces/unpaid.dart';

class Lien extends Unpaid {
  final faculty = true;
  // bool benefitsgiven = false;
  int pastService = 365 * 5;
  String salary = "notgiven";
  int maxConsecutive; //RANDOM NUMBER
  final isAppendable = false;
  bool agreementSigned = true;
  Lien() {
    maxConsecutive = (pastService ~/ 5);
  }
}
