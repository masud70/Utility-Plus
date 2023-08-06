import 'package:conversion_units/conversion_units.dart';
import 'package:utility_plus/feature/weather/functions/weather_data.dart';

class UnitConverter {
  static String convertUnit(
    String temperature,
    String unitOld,
    String unitNew,
  ) {
    double temp = double.parse(temperature.replaceAll(RegExp(r'[^\d.]'), ''));

    if (unitOld == WeatherData.unitCelsius) {
      if (unitNew == WeatherData.unitFahrenheit) {
        temp = Celsius.toFahrenheit(temp);
      } else if (unitNew == WeatherData.unitKelvin) {
        temp = Celsius.toKelvin(temp);
      }
    } else if (unitOld == WeatherData.unitFahrenheit) {
      if (unitNew == WeatherData.unitCelsius) {
        temp = Fahrenheit.toCelsius(temp);
      } else if (unitNew == WeatherData.unitKelvin) {
        temp = Fahrenheit.toKelvin(temp);
      }
    } else if (unitOld == WeatherData.unitKelvin) {
      if (unitNew == WeatherData.unitCelsius) {
        temp = Kelvin.toCelsius(temp);
      } else if (unitNew == WeatherData.unitFahrenheit) {
        temp = Kelvin.toFahrenheit(temp);
      }
    }

    return '${temp.toStringAsFixed(2)}$unitNew';
  }
}
