import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduatio_project/Shared/Components/Component.dart';
import 'data_container.dart';
import 'container_box.dart';
import 'score_screen.dart';

const activeColor = Colors.blueAccent;
const inactiveColor = Color(0xFFffffff);
int height = 180;
int weight = 70;
int age = 25;
double score=0.0;

class CheckWeightScreen extends StatefulWidget {

  @override
  State<CheckWeightScreen> createState() => _CheckWeightScreenState();
}

class _CheckWeightScreenState extends State<CheckWeightScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inactiveColor;

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inactiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inactiveColor;
      } else {
        maleBoxColor = inactiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inactiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inactiveColor;
      } else {
        femaleBoxColor = inactiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calculate Your Perfect Weight"),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateBoxColor(1);
                  });
                },
                child: ContainerBox(
                  boxColor: maleBoxColor,
                  childWidget: const DataContainer(icon: Icons.male, title: 'MALE'),
                ),
              )),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(2);
                    });
                  },
                  child: ContainerBox(
                    boxColor: femaleBoxColor,
                    childWidget:
                        const DataContainer(icon: Icons.female, title: 'FEMALE'),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ContainerBox(
              boxColor: const Color(0xFFffffff),
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: DataContainer.textStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: DataContainer.textStyle2,
                      ),
                      const Text(
                        'cm',
                        style: DataContainer.textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: activeColor,
                    inactiveColor: inactiveColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ContainerBox(
                  boxColor: const Color(0xFFffffff),
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'WEIGHT',
                        style: DataContainer.textStyle1,
                      ),
                      Text(
                        weight.toString(),
                        style: DataContainer.textStyle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            backgroundColor: activeColor,
                            child: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                            backgroundColor: activeColor,
                            child: const Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ContainerBox(
                  boxColor: const Color(0xFFffffff),
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'AGE',
                        style: DataContainer.textStyle1,
                      ),
                      Text(
                        age.toString(),
                        style: DataContainer.textStyle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            backgroundColor: activeColor,
                            child: const Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                            backgroundColor: activeColor,
                            child: const Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          Container(

            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color:Colors.indigo
            ),
            child:
            MaterialButton(

              height: 60,
              onPressed: () {
                double bmi =calculateWeight(weight, height);
                navigatorTo(context, ScoreScreen(age: age,bmiScore: bmi,));
              },
              child: const Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight:FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  double calculateWeight(int weight, int height){
    score = weight/pow(height/100,2);
    return score;
  }
}
