import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utility_plus/feature/weather/functions/weather_data.dart';

class WindSpeed extends StatefulWidget {
  const WindSpeed({super.key});

  @override
  State<WindSpeed> createState() => _WindSpeedState();
}

class _WindSpeedState extends State<WindSpeed> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherData>(
      builder: ((context, weather, child) => Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 226, 226, 226),
              borderRadius: BorderRadius.circular(10.0),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 230, 250, 255),
                  Color.fromARGB(255, 147, 200, 255)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      'images/windSpeed.png',
                      width: 30,
                      height: 80,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        const Text(
                          "Wind Speed",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${weather.windSpeed}",
                              style: const TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "km/h",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
