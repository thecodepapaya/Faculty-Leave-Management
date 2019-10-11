abstract class Leave {
  int remainingLeaves;
  int duration;
  int maxContiguousPossibleDuration;
  int sanctionedLeaves();
  bool applyLeave(int duration) {
    if (duration > maxContiguousPossibleDuration)
      return false;
    else
      return true;
  }

  void leavePeriodEnded() {}
  void leavePeriodStarted() {}
}
