import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leave_management/Utils/GlobalVariables.dart';

abstract class HouseKeeping {
  Future<void> doHouseKeeping() async {}

  static Future<bool> isAdmin({@required String email}) async {
    return false;
  }

  static MaterialColor randomColor() {
    List _colorsList = <MaterialColor>[
      Colors.red,
      Colors.amber,
      Colors.blue,
      Colors.blueGrey,
      Colors.brown,
      Colors.cyan,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.green,
      Colors.grey,
      Colors.indigo,
      Colors.lightBlue,
      Colors.lightGreen,
      Colors.lime,
      Colors.orange,
      Colors.pink,
      Colors.purple,
      Colors.teal,
      Colors.yellow,
    ];
    return _colorsList[Random().nextInt(19)];
  }

  static Future<int> updateHistory() async {
    return 0;
  }

  // static Future<int> dailyRefresh() async {
  //   return 0;
  // }

  // static Future<int> monthylRefresh() async {
  //   return 0;
  // }

  // static Future<int> yearlyRefresh() async {
  //   return 0;
  // }

  static Future<bool> checkDetailsExist({@required String email}) async {
    DocumentSnapshot doc =
        await Firestore.instance.collection(email).document("data").get();
    if (doc.data["email"] == email) {
      print("Details Already Exist");
      return true;
    } else {
      print("Details DO NOT Exist");
      return false;
    }
  }

  static Future<void> initializeUserData({@required String emailId}) async {
    // bool detailsExist = await checkDetailsExist();
    if (await checkDetailsExist(email: emailId) == false) {
      print("Initializing data for $emailId");
      await Firestore.instance.collection(emailId).document("data").setData(
        {
          "lastSeen": DateTime.now().millisecondsSinceEpoch.toString(),
          "name": GlobalVariables.user.displayName,
          "email": GlobalVariables.user.email,
          "lastInitialized": DateTime.now().millisecondsSinceEpoch.toString(),
        },
        merge: true,
      );
    }
  }

  static Future<int> updateLastSeen({@required String emailId}) async {
    print("Updating last seen for $emailId");
    await Firestore.instance.collection(emailId).document("data").setData(
      {
        "lastSeen": DateTime.now().millisecondsSinceEpoch.toString(),
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
      else {
        print("======No INternet connection");
        return false;
      }
    } on SocketException catch (_) {
      print("Connctivity Problem");
      return false;
    } catch (error, stackTrace) {
      print("Encountered Exception: $error");
      print("Stack Trace: $stackTrace");
      return false;
    }
  }

  static showInfoDialog({
    @required BuildContext receivedContext,
    Widget title,
    Widget content,
    bool barrierDismissible,
    Function onPressedFunc(),
  }) {
    return showDialog(
      context: receivedContext,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title,
          content: content,
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(receivedContext).pop();
              },
            ),
            FlatButton(
              child: Text("OK"),
              onPressed: onPressedFunc,
            ),
          ],
        );
      },
    );
  }
}
