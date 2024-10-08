import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final double bmi;
  final String gender;

  ResultsPage({required this.bmi, required this.gender});

  @override
  Widget build(BuildContext context) {
    String classification = "";
    if (gender == "male") {
      if (bmi < 18) {
        classification = "Underweight";
      } else if (bmi >= 18 && bmi <= 25) {
        classification = "Normal";
      } else if (bmi > 25 && bmi <= 27) {
        classification = "Overweight";
      } else {
        classification = "Obese";
      }
    } else {
      if (bmi < 17) {
        classification = "Underweight";
      } else if (bmi >= 17 && bmi <= 23) {
        classification = "Normal";
      } else if (bmi > 23 && bmi <= 27) {
        classification = "Overweight";
      } else {
        classification = "Obese";
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Result', style: TextStyle(fontSize: 24.0)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF485563), Color(0xFF29323C)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Your BMI: ${bmi.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Classification: $classification',
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF485563), Color(0xFF29323C)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 35.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
