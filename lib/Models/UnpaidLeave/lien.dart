import 'package:leave_management/Models/Interfaces/unpaid.dart';

class Lien extends Unpaid {
  final faculty = true;
  // bool benefitsgiven = false;
  var pastService = 365 * 5;
  String salary = "notgiven";
  final maxConsecutive = 365; //past_service/5 //RANDOM NUMBER
  final isAppendable = false;
  bool agreementSigned = true;
}
