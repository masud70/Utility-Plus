import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WeatherApi {
  static const String apiKey = '7045ebf781e9c1f2cdf617e12341b585';
  static const String apiUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  static Future<Map<String, dynamic>?> fetchWeatherDataByLocationName(
      String locationName) async {
    final response =
        await http.get(Uri.parse('$apiUrl?q=$locationName&appid=$apiKey'));

    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        print(data);
        // Store the weather data in SharedPreferences
        final preferences = await SharedPreferences.getInstance();
        preferences.setString('weatherData', jsonEncode(data));
        return data;
      } catch (e) {
        print('Error parsing JSON data: $e');
      }
    } else {
      print('Error fetching weather data: ${response.statusCode}');
    }

    return null;
  }

  static Future<Map<String, dynamic>?> getStoredWeatherData() async {
    final preferences = await SharedPreferences.getInstance();
    final jsonString = preferences.getString('weatherData');
    if (jsonString != null) {
      return jsonDecode(jsonString);
    } else {
      return null;
    }
  }
}
