import '../models/bmi_model.dart';

class BMIController {
  double weight;
  double height;

  BMIController({required this.weight, required this.height});

  double calculateBMI() {
    BMIModel model = BMIModel(weight: weight, height: height);
    return model.calculateBMI();
  }

  String getBMICategory(double bmi) {
    BMIModel model = BMIModel(weight: weight, height: height);
    return model.getBMICategory(bmi);
  }
}
