import 'package:flutter/material.dart';
import 'package:utility_plus/feature/weather/util/CustomSearchBar.dart';
import 'package:utility_plus/feature/weather/util/Temperature.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String searchText = "Chittagong";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomSearchBar(
              onChangeText: (text) {
                setState(() {
                  searchText = text;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Temperature(searchText: searchText),
            const Text('data'),
            const Text('data'),
          ],
        ),
      ),
    );
  }
}
