import 'package:flutter/material.dart';
import 'results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 160;
  int weight = 55;
  String gender = "male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Calculator', style: TextStyle(fontSize: 24.0)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildGenderSelection(),
            SizedBox(height: 20.0),
            _buildHeightSelection(),
            SizedBox(height: 20.0),
            _buildWeightSelection(),
            SizedBox(height: 20.0),
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Select Your Gender',
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildGenderIcon(Icons.male, "male"),
              SizedBox(width: 20.0),
              _buildGenderIcon(Icons.female, "female"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenderIcon(IconData icon, String genderType) {
    return GestureDetector(
      onTap: () {
        setState(() {
          gender = genderType;
        });
      },
      child: Container(
        height: 115.0,
        width: 115.0,
        decoration: BoxDecoration(
          color: gender == genderType ? Color(0xff2804f6) : Color(0xFF111328),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildHeightSelection() {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Height (in cm): $height',
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          ),
          SizedBox(height: 10.0),
          Slider(
            value: height.toDouble(),
            min: 100.0,
            max: 250.0,
            onChanged: (double newValue) {
              setState(() {
                height = newValue.toInt();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeightSelection() {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Weight (in kg): $weight',
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildRoundButton('-', () {
                setState(() {
                  weight--;
                });
              }),
              SizedBox(width: 20.0),
              _buildRoundButton('+', () {
                setState(() {
                  weight++;
                });
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoundButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 36.0),
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
        primary: Color(0xFF4C4F5E),
      ),
    );
  }

  Widget _buildCalculateButton() {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xff131212),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          double heightInMeters = height / 100.0;
          double bmi = weight / (heightInMeters * heightInMeters);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsPage(bmi: bmi, gender: gender),
            ),
          );
        },
        child: Text(
          'CALCULATE',
          style: TextStyle(fontSize: 37.0),
        ),
      ),
    );
  }
}
