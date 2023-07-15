class Converter {
  double converted = 0.0;
  String pre, now, temp;
  Converter({required this.temp, required this.pre, required this.now});

  String get() {
    double tempD = double.parse(temp);
    if (pre.contains("C")) {
      tempD = tempD + 273.15;
    } else if (pre.contains("F")) {
      tempD = (tempD - 32) * 5 / 9 + 273.15;
    }

    if (now.contains('C')) {
      converted = tempD - 273.15;
    } else if (now.contains('F')) {
      converted = (tempD - 273.15) * 9 / 5 + 32;
    } else {
      converted = tempD;
    }

    return converted.toStringAsFixed(2);
  }
}
