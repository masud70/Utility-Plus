import 'package:flutter/material.dart';
import 'package:utility_plus/feature/weather/functions/temperatureConvert.dart';
import 'package:utility_plus/feature/weather/functions/weatherApi.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  String selectedOption = '\u00B0C';
  List<String> options = ['\u00B0C', '\u00B0F', 'K'];
  String temperature = "Null";
  String weatherConditionCode = '10d';

  Future<void> fetchData(String locationName) async {
    final weatherData =
        await WeatherApi.fetchWeatherDataByLocationName(locationName);

    if (weatherData != null) {
      setState(() {
        weatherConditionCode = weatherData['weather'][0]['icon'];
        temperature = Converter(
                temp: weatherData['main']['temp'].toString(),
                pre: 'K',
                now: "C")
            .get();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData('Chittagong');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 250,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.thermostat,
                        size: 30,
                      ),
                    ),
                  ]),
                ),
                const Expanded(
                  child: Text(
                    "Temperature",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Unit: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      DropdownButton<String>(
                        value: selectedOption,
                        onChanged: (String? newValue) {
                          setState(() {
                            // selectedOption = newValue!;
                            setState(() {
                              temperature = Converter(
                                      temp: temperature,
                                      pre: selectedOption,
                                      now: newValue!)
                                  .get();
                            });
                            selectedOption = newValue!;
                          });
                        },
                        items: options.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(
                              option,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Image.network(
              'http://openweathermap.org/img/wn/$weatherConditionCode.png',
              width: 70,
            ),
            Text(
              "$temperature$selectedOption",
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
