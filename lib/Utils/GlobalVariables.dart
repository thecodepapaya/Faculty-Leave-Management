import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalVariables {
  static SharedPreferences prefs;
  static FirebaseUser user;

  static String emailPrefs = "emailPrefs";
  static String namePrefs = "namePrefs";
  static String timeStampPrefs = "timeStampPrefs";

  static String email;
  static String name;
  static String timeStamp;
}
