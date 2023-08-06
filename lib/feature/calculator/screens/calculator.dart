import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int height = 180;
  int weight = 70;
  double bmi = 0.0;

  void calculateBMI() {
    double heightInMeters = height / 100.0;
    bmi = weight / (heightInMeters * heightInMeters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: height.toDouble(),
            min: 120,
            max: 220,
            onChanged: (newValue) {
              setState(() {
                height = newValue.round();
              });
            },
          ),
          Text('Height: $height cm'),
          SizedBox(height: 16),
          Slider(
            value: weight.toDouble(),
            min: 40,
            max: 150,
            onChanged: (newValue) {
              setState(() {
                weight = newValue.round();
              });
            },
          ),
          Text('Weight: $weight kg'),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              calculateBMI();
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('BMI Result'),
                    content: Text('Your BMI is ${bmi.toStringAsFixed(2)}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Calculate BMI'),
          ),
        ],
      ),
    );
  }
}
