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

  static Color randomColor({int density}) {
    List _colorsList = <Color>[
      Colors.red[density],
      Colors.amber[density],
      Colors.blue[density],
      Colors.blueGrey[density],
      Colors.brown[density],
      Colors.cyan[density],
      Colors.deepOrange[density],
      Colors.deepPurple[density],
      Colors.green[density],
      Colors.grey[density],
      Colors.indigo[density],
      Colors.lightBlue[density],
      Colors.lightGreen[density],
      Colors.lime[density],
      Colors.orange[density],
      Colors.pink[density],
      Colors.purple[density],
      Colors.teal[density],
      Colors.yellow[density],
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
