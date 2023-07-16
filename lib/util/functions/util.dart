import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Util {
  void showToast(String msg, {bool danger = false}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor:
          danger ? Colors.red : const Color.fromARGB(255, 17, 255, 140),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
