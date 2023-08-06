import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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

  Future<String> getLocationNameFromLatLong({double? lat, double? long}) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat!, long!);

      return placemarks.first.locality ?? "Unknown Location";
    } catch (e) {
      return "Unknown Location";
    }
  }

  Future<Map<String, String>> getLocationCoordinates(
      {String locationName = ""}) async {
    try {
      if (locationName == "") {
        LocationPermission permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          throw Exception('Location permission denied');
        }
        // Get the current position of the device
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        String location = await getLocationNameFromLatLong(
          lat: position.latitude,
          long: position.longitude,
        );

        return {
          "url": "lat=${position.latitude}&lon=${position.longitude}",
          "locationName": location
        };
      } else {
        List<Location> locations = await locationFromAddress(locationName);

        if (locations.isEmpty) {
          throw Exception('No location found for $locationName');
        }

        return {
          "url": "lat=${locations[0].latitude}&lon=${locations[0].longitude}",
          "locationName": locationName
        };
      }
    } catch (e) {
      return {
        "url": "lat=22.4824428&lon=91.8029412",
        "locationName": "Chittagong"
      };
    }
  }
}
