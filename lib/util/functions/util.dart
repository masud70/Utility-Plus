import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  String toCamelCase(String input) {
    List<String> words = input.split(' ');
    String camelCase = '';

    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      if (word.isNotEmpty) {
        if (camelCase.isNotEmpty) {
          camelCase += ' ';
        }
        camelCase += word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
    }

    return camelCase;
  }

  String formatUnixTimeToHourMinute(int unixTimestamp) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }
}
