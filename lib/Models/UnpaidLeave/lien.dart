import 'package:leave_management/Models/Interfaces/Unpaid.dart';

class lien extends Unpaid {
  final faculty = true;
  // bool benefitsgiven = false;
  var past_service = 365 * 5;
  String salary = "notgiven";
  final maxConsecutive = 365; //past_service/5 //RANDOM NUMBER
  final isAppendable = false;
  bool agreemnent_signed = true;
}
