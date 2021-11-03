import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const kAppTitle = TextStyle(
    fontSize: 26.0, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic);

const kWhiteTextButton = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.1,
);

const kBlueTextButton = TextStyle(color: Color(0xff2449e7), fontSize: 16);

DateTime? currentBackPressTime;
Future<bool> onWillPop() {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
    currentBackPressTime = now;
    Fluttertoast.showToast(msg: "Press back again to exit");
    return Future.value(false);
  }
  return Future.value(true);
}