import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utility_plus/feature/weather/functions/weather_data.dart';

class Humidity extends StatefulWidget {
  const Humidity({super.key});

  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> {
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
                    flex: 6,
                    child: Column(
                      children: [
                        const Text(
                          "Humidity",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${weather.humidity}",
                              style: const TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "%",
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
                  Expanded(
                    flex: 6,
                    child: Image.asset(
                      'images/humidity.png',
                      width: 30,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
