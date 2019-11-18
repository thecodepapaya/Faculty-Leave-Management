import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalVariables {
  static SharedPreferences prefs;
  static FirebaseUser user;

  static List<dynamic> adminEmails;

  static String emailPrefs = "emailPrefs";
  static String namePrefs = "namePrefs";
  static String timeStampPrefs = "timeStampPrefs";

  static String email;
  static String name;
  static String timeStamp;

  static const String casualLeave = "Casual";
  static const String childCare = "ChildCare";
  static const String maternity = "Maternity";
  static const String medical = "Medical";
  static const String paternity = "Paternity";
  static const String halfPaid = "HalfPaid";
  static const String fullPaid = "FullPaid";
  static const String specialCasual = "SpecialCasual";
  static const String vacation = "Vacation";
  static const String extraOrdinary = "ExtraOrdinary";
  static const String leaveNotDue = "LeaveNotDue";
  static const String lien = "Lien";
  static const String sabbatical = "Sabbatical";
  static const String special = "Special";
}
