import 'package:leave_management/Models/Interfaces/unpaid.dart';

class Lien extends Unpaid {
  final faculty = true;
  // bool benefitsgiven = false;
  int pastService = 365 * 5; //random number
  String salary = "notgiven";
  int maxConsecutive; //RANDOM NUMBER
  final isAppendable = false;
  bool agreementSigned = true;
  Lien() {
    maxConsecutive = (pastService ~/ 5);
  }
  @override
  bool applyLeave(int duration) {
    if ((pastService <= 365 * 5) || (maxConsecutive > pastService ~/ 5))
      return false;
    else
      return true;
  }

  @override
  int sanctionedLeaves() {
    if (applyLeave(duration) == true) // TODO: implement sanctionedLeaves
      return duration;
  }
}
