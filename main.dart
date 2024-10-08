import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              primary: Color(0xffe7e8ed),
              secondary: Color(0xff111735),
              onPrimary: Color(0xff000000),
            ),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}
