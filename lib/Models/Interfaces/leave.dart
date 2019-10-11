abstract class Leave {
  int remainingLeaves;
  int duration;
  int maxContiguousPossibleDuration;
  bool leaveApplicable;
  int sanctionedLeaves(int duration) {
    if (applyLeave(duration))
      return duration;
    else
      return -1;
  }

  bool applyLeave(int duration) {
    if (duration > maxContiguousPossibleDuration)
      return false;
    else
      return true;
  }

  void leavePeriodEnded() {}
  void leavePeriodStarted() {}
}
