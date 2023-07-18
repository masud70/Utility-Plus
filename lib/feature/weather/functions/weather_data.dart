import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:utility_plus/feature/weather/functions/unit_converter.dart';
import 'package:utility_plus/util/functions/util.dart';

class WeatherData extends ChangeNotifier {
  String locationName;
  bool isLoading = false;
  static const String apiKey = '7045ebf781e9c1f2cdf617e12341b585';
  static const String apiUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  // Class properties to store temperature data
  String? temperature;
  String? description;
  String? iconCode;
  String? humidity;
  String? windSpeed;
  String? sunrise;
  String? sunset;

  // Temperature unit options
  static const String unitCelsius = '\u00B0C';
  static const String unitKelvin = 'K';
  static const String unitFahrenheit = '\u00B0F';

  // Default temperature unit (Kelvin)
  String currentUnit = unitCelsius;

  WeatherData({this.locationName = "Chittagong"});

  Future<Map<String, dynamic>> fetchData(
      {String location = "Chittagong"}) async {
    final response =
        await http.get(Uri.parse('$apiUrl?q=$location&appid=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Extract the relevant temperature data from the API response
      temperature = UnitConverter.convertUnit(
        "${data['main']['temp'].toString()}K",
        unitKelvin,
        currentUnit,
      );
      locationName = Util().toCamelCase(location);
      description = data['weather'][0]['description'];
      iconCode = data['weather'][0]['icon'];
      humidity = data['main']['humidity'].toString();
      windSpeed = (data['wind']['speed'] * 3.6).toStringAsFixed(2);
      sunrise = Util().formatUnixTimeToHourMinute(data['sys']['sunrise']);
      sunset = Util().formatUnixTimeToHourMinute(data['sys']['sunset']);
      notifyListeners();

      // Return status as success and an empty error message
      return {
        'status': 'success',
        'error': '',
      };
    } else {
      // Return status as error and an error message
      return {
        'status': 'error',
        'error': 'Error fetching weather data.',
      };
    }
  }

  void onSearch(searchTerm) async {
    isLoading = true;
    notifyListeners();
    await fetchData(location: searchTerm);
    isLoading = false;
    notifyListeners();
  }

  // Method to convert temperature to a new unit
  void convertUnitTo(String newUnit) {
    temperature = UnitConverter.convertUnit(
      temperature!,
      currentUnit,
      newUnit,
    );
    currentUnit = newUnit;
    notifyListeners();
  }
}
