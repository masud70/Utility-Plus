import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utility_plus/feature/weather/functions/weather_data.dart';
import 'package:utility_plus/feature/weather/util/custom_search_bar.dart';
import 'package:utility_plus/feature/weather/util/humidity.dart';
import 'package:utility_plus/feature/weather/util/sunrise.dart';
import 'package:utility_plus/feature/weather/util/sunset.dart';
import 'package:utility_plus/feature/weather/util/temperature.dart';
import 'package:utility_plus/feature/weather/util/wind_speed.dart';
import 'package:utility_plus/util/widgets/loader.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Future<Map<String, dynamic>>? weatherFuture;

  @override
  void initState() {
    super.initState();
    weatherFuture = fetch();
  }

  Future<Map<String, dynamic>> fetch() async {
    return Provider.of<WeatherData>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherData>(
      builder: ((context, weather, _) {
        if (weather.isLoading) {
          return const Loader();
        } else {
          return FutureBuilder(
            future: weatherFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              } else {
                return Scaffold(
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomSearchBar(
                            onChangeText: (text) {
                              weather.onSearch(text);
                            },
                          ),
                          const SizedBox(height: 16.0),
                          const Temperature(),
                          const SizedBox(height: 16.0),
                          const Humidity(),
                          const SizedBox(height: 16.0),
                          const WindSpeed(),
                          const SizedBox(height: 16.0),
                          const Sunrise(),
                          const SizedBox(height: 16.0),
                          const Sunset(),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          );
        }
      }),
    );
  }
}
