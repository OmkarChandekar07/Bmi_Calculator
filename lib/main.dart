import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(

        appBarTheme: AppBarTheme(backgroundColor:  Color.fromRGBO(10, 13, 34, 1),),
       scaffoldBackgroundColor: Color.fromRGBO(10, 13, 34, 1),
       textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white))

      ),


      home: InputPage(),
    );
  }
}

