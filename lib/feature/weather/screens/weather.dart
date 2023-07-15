import 'package:flutter/material.dart';
import 'package:utility_plus/feature/weather/util/CustomSearchBar.dart';
import 'package:utility_plus/feature/weather/util/Temperature.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomSearchBar(),
            SizedBox(height: 16.0),
            Temperature(),
            Text('data'),
            Text('data'),
          ],
        ),
      ),
    );
  }
}
