class AppTimer {
  int daysPassed;
  int monthsPassed;
  int yearPassed;

  AppTimer() {
    this.daysPassed = 0;
    this.monthsPassed = 0;
    this.yearPassed = 0;
  }

  void tickDay() {
    daysPassed++;
    if (daysPassed % 30 == 0 && daysPassed != 0) {
      daysPassed = 0;
      tickMonth();
    }
  }

  void tickMonth() {
    monthsPassed++;
    if (monthsPassed % 12 == 0 && monthsPassed != 0) {
      monthsPassed = 0;
      tickYear();
    }
  }

  void tickYear() {
    yearPassed++;
  }
}
