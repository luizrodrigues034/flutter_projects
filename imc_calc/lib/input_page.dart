import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imc_calc/animeted_button.dart';
import 'package:imc_calc/constanst.dart';
import 'package:imc_calc/gender_propeties.dart';
import 'package:imc_calc/reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectGender;
  double heigthPeaple = 100;
  int wheight = 0;
  int age = 18;

  void setMan() {
    setState(() {
      selectGender = Gender.male;
    });
  }

  void setFemale() {
    setState(() {
      selectGender = Gender.female;
    });
  }

  Timer? _timer;
  void _startCrement(VoidCallback crementFunction) {
    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      setState(crementFunction);
    });
  }

  void _stopCrement() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Imc Calculator")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    selectColor: selectGender == Gender.male
                        ? kBottomContainerColour
                        : kInactiveCardColor,
                    chieldContent: GenderProeperties(
                      icone: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    setGender: setMan,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    selectColor: selectGender == Gender.female
                        ? kBottomContainerColour
                        : kInactiveCardColor,
                    chieldContent: GenderProeperties(
                      icone: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    setGender: setFemale,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              selectColor: kActiveCardColor,
              chieldContent: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        heigthPeaple.toStringAsFixed(0),
                        style: kNumberStyle,
                      ),
                      Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kBottomContainerColour,
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      inactiveColor: const Color.fromARGB(122, 197, 197, 197),
                      value: heigthPeaple,
                      onChanged: (newRating) => setState(() {
                        heigthPeaple = newRating;
                      }),
                      max: 250,
                      min: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    selectColor: kActiveCardColor,
                    chieldContent: Column(
                      children: [
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(wheight.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            AnimetedButton(
                              onPressed: () {
                                setState(() {
                                  wheight--;
                                });
                              },
                              stopIncrement: _stopCrement,
                              onTapPush: () => _startCrement(() => wheight--),
                              label: '',
                              icon: FontAwesomeIcons.minus,
                            ),
                            AnimetedButton(
                              onPressed: () {
                                setState(() {
                                  wheight++;
                                });
                              },
                              onTapPush: () => _startCrement(() => wheight++),
                              stopIncrement: _stopCrement,
                              label: '',
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    selectColor: kActiveCardColor,
                    chieldContent: Column(
                      children: [
                        Text('AGE', style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            AnimetedButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              stopIncrement: _stopCrement,
                              onTapPush: () => _startCrement(() => age--),
                              label: '',
                              icon: FontAwesomeIcons.minus,
                            ),
                            AnimetedButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              onTapPush: () => _startCrement(() => age++),
                              stopIncrement: _stopCrement,
                              label: '',
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            height: kHeigthBottom,
            color: kBottomContainerColour,
            child: Center(
              child: Text(
                'Calculate',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
