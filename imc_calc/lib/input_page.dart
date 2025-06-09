import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  void _startIncrement() {
    // setState(() => age++);

    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      setState(() => wheight = wheight + 1);
    });
  }

  void _stopCrement() {
    _timer?.cancel();
    _timer = null;
  }

  void _startDecrement() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      setState(() {
        wheight--;
      });
    });
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
                            _AnimetedButton(
                              onPressed: () {
                                setState(() {
                                  wheight--;
                                });
                              },
                              stopIncrement: _stopCrement,
                              onTapPush: _startDecrement,
                              label: '',
                              icon: FontAwesomeIcons.minus,
                            ),
                            _AnimetedButton(
                              onPressed: () {
                                setState(() {
                                  wheight++;
                                });
                              },
                              onTapPush: _startIncrement,
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
                Expanded(child: ReusableCard(selectColor: kActiveCardColor)),
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

class _AnimetedButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;
  final onTapPush;
  final stopIncrement;
  const _AnimetedButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.onTapPush,
    this.stopIncrement,
  });

  @override
  State<_AnimetedButton> createState() => __AnimetedButtonState();
}

class __AnimetedButtonState extends State<_AnimetedButton> {
  double _scale = 1.0;
  Timer? _holdTimer;
  bool _holding = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _scale = 0.80);

        _holding = false;

        _holdTimer = Timer(Duration(milliseconds: 300), () {
          _holding = true;
          widget.onTapPush?.call();
        });
      },
      onTapUp: (_) {
        setState(() => _scale = 1.0);

        _holdTimer?.cancel();

        if (!_holding) {
          widget.onPressed();
        }

        widget.stopIncrement?.call();
      },
      onTapCancel: () {
        setState(() => _scale = 1.0);

        _holdTimer?.cancel();
        widget.stopIncrement?.call();
      },
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: OutlinedButton(
          onPressed: null,
          style: OutlinedButton.styleFrom(
            backgroundColor: kBottomContainerColour,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: CircleBorder(),
          ),
          child: Icon(widget.icon, color: Colors.white, size: 40, weight: 1000),
        ),
      ),
    );
  }
}
