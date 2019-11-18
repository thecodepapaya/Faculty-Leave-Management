import 'casualLeave.dart';

class SpecialCasual extends CasualLeave {
  @override
  // TODO: implement duration
  int get duration => 15;
  @override
  // TODO: implement maxConsecutive
  int get maxConsecutive => 15;
  @override
  // TODO: implement remainingLeaves
  int get remainingLeaves => 15;
}
