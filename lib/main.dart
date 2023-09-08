import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utility_plus/feature/bmi/screens/bmi.dart';
import 'package:utility_plus/feature/todo/screens/todo.dart';
import 'package:utility_plus/feature/weather/functions/weather_data.dart';
import 'package:utility_plus/feature/weather/screens/weather.dart';
import 'package:utility_plus/util/widgets/drawer_item.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => WeatherData())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        home: MyHomePage(title: appTitle),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<String> _appbarTitle = <String>[
    // 'Home',
    'Weather',
    'BMI Calculator',
    'Todo'
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    // Home(),
    Weather(),
    BMICalculator(),
    Todo()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.menu),
        centerTitle: true,
        title: Text(
          _appbarTitle[_selectedIndex],
          style: const TextStyle(fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 73, 6, 144),
      ),
      body: SafeArea(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 73, 6, 144),
              ),
              child: Center(
                child: Text(
                  'Utility+',
                  style: TextStyle(
                      fontSize: 45,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              title: const DrawerItem(title: 'Weather'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const DrawerItem(title: 'BMI Calculator'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const DrawerItem(title: 'Todo'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
