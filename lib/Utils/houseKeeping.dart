import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract class HouseKeeping {
  Future<void> doHouseKeeping() async {}

  static Future<bool> isAdmin({@required String email}) async {
    return false;
  }

  static Future<int> updateHistory() async {
    return 0;
  }

  static Future<int> dailyRefresh() async {
    return 0;
  }

  static Future<int> monthylRefresh() async {
    return 0;
  }

  static Future<int> yearlyRefresh() async {
    return 0;
  }

  static Future<int> updateLastSeen({@required String emailId}) async {
    print("Updating last seen for $emailId");
    await Firestore.instance.collection(emailId).document("data").setData(
      {
        "lastSeen": FieldValue.serverTimestamp(),
      },
      merge: true,
    );
    return 0;
  }

  static Future<bool> checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        return true;
      else
        return false;
    } on SocketException catch (_) {
      print("Connctivity Problem");
      return false;
    } catch (error, stackTrace) {
      print("Encountered Exception: $error");
      print("Stack Trace: $stackTrace");
      return false;
    }
  }
}
