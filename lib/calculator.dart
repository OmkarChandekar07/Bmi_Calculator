import 'dart:math' ; // Import math library with an alias

class Calculator {
 // Initialize with a default value (here, 0.0)

  Calculator(this.height, this.weight) ;

  final int height;
  final int weight;
  late double _bmi;
    

  String bmiCalculate() {
     _bmi = weight /pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi >= 18.5) { // Adjusted lower limit for normal weight
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight.Try to excercise more";
    } else if (_bmi >= 18.5) {
      return "You have a normal body weight.Good Job !";
    } else {
      return "You have a lower than normal body weight.You can eat bit more";
    }
  }
}
