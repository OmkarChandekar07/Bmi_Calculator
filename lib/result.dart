import 'package:bmi_calculatotr_app/constant.dart';
import 'package:bmi_calculatotr_app/reusable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class result extends StatelessWidget {

  result({@required this.bmiResult,@required this.resultText,@required this.intrepeton});
  final bmiResult;
  final resultText;
  final intrepeton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Result",
              style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w900),
            ),
            Expanded(
                child: ReusableCard(
                    colour: inactivecolor,
                    cardChild: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Text(
                                resultText,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Center(
                              child: Text(bmiResult,style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 70,
                                    fontWeight: FontWeight.w900),),
                            ),
                                  Text(intrepeton,textAlign:TextAlign.center, style: TextStyle(
                              
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),),
                                  
                          ],
                        ),
                      ),
                    ))),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        child: Container(
                        decoration: BoxDecoration(
                        color: botomContainerColor,
                        borderRadius: BorderRadius.circular(10)),
                                        margin: EdgeInsets.only(top: 10),
                                        width: double.infinity,
                                        height: 70,
                                        child: Center(child: Text("ReCalculate", style:TextStyle(fontSize: 28,fontWeight: FontWeight.w600 ))),
                                      ),
                      ),
                    ),
          ],
        ));
  }
}
