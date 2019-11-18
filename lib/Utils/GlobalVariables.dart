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

  static const String casualLeave = 'Casual Leave';
  static const String childCare = 'Child Care Leave';
  static const String maternity = 'Maternity Leave';
  static const String medical = 'Medical Leave';
  static const String paternity = 'Paternity Leave';
  static const String halfPaid = 'Half Paid Leave';
  static const String fullPaid = 'Full Paid Leave';
  static const String specialCasual = 'Special Casual Leave';
  static const String vacation = 'Vacation Leave';
  static const String extraOrdinary = 'Extra Ordinary Leave';
  static const String leaveNotDue = 'Leave Not Due';
  static const String lien = 'Lien Leave';
  static const String sabbatical = 'Sabbatical Leave';
  static const String special = 'Special Leave';
}
