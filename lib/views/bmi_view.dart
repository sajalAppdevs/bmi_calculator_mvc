import 'package:flutter/material.dart';
import '../controllers/bmi.controller.dart';

class BMIView extends StatefulWidget {
  @override
  _BMIViewState createState() => _BMIViewState();
}

class _BMIViewState extends State<BMIView> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String? _result;
  String? _category;

  void _calculateBMI() {
    final weight = double.tryParse(_weightController.text);
    final height = double.tryParse(_heightController.text);

    if (weight != null && height != null) {
      BMIController controller = BMIController(weight: weight, height: height);
      final bmi = controller.calculateBMI();
      setState(() {
        _result = bmi.toStringAsFixed(2);
        _category = controller.getBMICategory(bmi);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Height (m)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            if (_result != null && _category != null) ...[
              Text(
                'Your BMI: $_result',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Category: $_category',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
