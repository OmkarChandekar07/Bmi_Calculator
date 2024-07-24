import 'package:bmi_calculatotr_app/calculator.dart';
import 'package:bmi_calculatotr_app/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable.dart';
import 'icons.dart';
import 'constant.dart';


enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height=180;
  int weight=60;
  int age=21;

    Color maleCard =inactivecolor;
    Color femaleCard=inactivecolor;

    void updateColor(Gender selectedGender){
      if(selectedGender==Gender.male){
        if(maleCard==inactivecolor){
          maleCard=activecolor;
          femaleCard=inactivecolor;
        }else{
            maleCard==inactivecolor;
        }
      }
      if(selectedGender==Gender.female){
        if(femaleCard==inactivecolor){
          femaleCard=activecolor;
          maleCard=inactivecolor;
        }else{
            femaleCard==inactivecolor;
        }
      }
    }
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(Gender.male);
                    });
                  },
                  child: ReusableCard(
                    colour: maleCard,
                    cardChild: icons(icon: FontAwesomeIcons.mars,label: "MALE",),
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: ReusableCard(
                                    colour: femaleCard,
                                    cardChild: icons(icon: FontAwesomeIcons.venus,label: "FEMALE",)
                                  ),
                  )),
            ]),


            Expanded(
              child: ReusableCard(
              colour: inactivecolor,
              cardChild:Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height",style: label,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),style: textNo,),
                        Text("cm",style: label,)
                      ],
                    ),
                    Slider(value: height.toDouble(), 
                    activeColor:Color(0xFFEB1555) ,
                    inactiveColor: Color(0xFF8D8E98),
                    max: 300,
                    min: 150,
                    onChanged: (double newvalue) {
                      setState(() {
                        height=newvalue.toInt();
                      });
                      print(newvalue.toInt());
                    },
                    )
                  ],
                ),
              )
            )),




            Row(children: [
              Expanded(
                  child: ReusableCard(
                colour: inactivecolor,
                cardChild:Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Weight",style: label,),
                      Text(weight.toString(),style: textNo,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(
                             icon: FontAwesomeIcons.minus,
                             onPressed:(){
                              setState(() {
                            print(weight);
                                  weight--;
                              });
                             },
                          ),
                          SizedBox(width: 15,),
                          RoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed:(){
                              setState(() {
                                print(weight);
                                weight++;
                              });
                            }
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                )
              )),
              Expanded(
                  child: ReusableCard(
                colour: inactivecolor,
                cardChild:Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Age",style: label,),
                      Text(age.toString(),style: textNo,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(icon:FontAwesomeIcons.minus, 
                      onPressed: (){
                        setState(() {
                          age--;
                        });
                      }
                      ),
                      SizedBox(width: 15,),
                      RoundButton(icon:FontAwesomeIcons.plus, 
                      onPressed: (){
                        setState(() {
                          age++;
                        });
                      }
                      ),
                        ],
                      )

                    ],
                  ),
                )
              )),
            ]),


          
            GestureDetector(
              onTap: () {
                Calculator calc = Calculator(height,weight);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>result(
                  bmiResult: calc.bmiCalculate(),
                  resultText: calc.getResult(),
                  intrepeton: calc.interpretation(),
                ))); 
              },
              child: Container(
                decoration: BoxDecoration(
                    color: botomContainerColor,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 70,
                child: Center(child: Text("Calculate", style:TextStyle(fontSize: 28,fontWeight: FontWeight.w600 ))),
              ),
            )
          ],
        ));
  }
}



class RoundButton extends StatelessWidget {
  RoundButton({required this.icon ,required this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon,color: Colors.white,),
      elevation: 0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}