class BMIModel {
  double weight; // in kg
  double height; // in meters

  BMIModel({required this.weight, required this.height});

  double calculateBMI() {
    if (height <= 0) return 0; // Prevent division by zero
    return weight / (height * height);
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal weight";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obesity";
    }
  }
}
