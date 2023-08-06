import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
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
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              calculateBMI();
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('BMI Result'),
                    content: Text('Your BMI is ${bmi.toStringAsFixed(2)}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Calculate BMI'),
          ),
        ],
      ),
    );
  }
}
