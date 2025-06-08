import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color colorCard = Color(0xFF1D1E33);
const bottomContainerColour = Color(0xFFEB1555);
const double heigthBottom = 80;
const double iconCardSize = 80;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Imc Calculator")),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    selectColor: colorCard,
                    chieldContent: GenderProeperties(
                      icone: FontAwesomeIcons.mars,
                      genero: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    selectColor: colorCard,
                    chieldContent: GenderProeperties(
                      icone: FontAwesomeIcons.venus,
                      genero: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: ReusableCard(selectColor: colorCard)),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(selectColor: colorCard)),
                Expanded(child: ReusableCard(selectColor: colorCard)),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            height: heigthBottom,
            color: bottomContainerColour,
            child: Center(
              child: Text(
                'RESULTADO',
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

class GenderProeperties extends StatelessWidget {
  final IconData icone;
  final String genero;
  const GenderProeperties({required this.icone, required this.genero});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icone, size: iconCardSize),
        SizedBox(height: 15),
        Text(
          genero,
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(145, 248, 216, 233),
          ),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({required this.selectColor, this.chieldContent});

  final Color selectColor;
  final Widget? chieldContent;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: selectColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: chieldContent,
    );
  }
}
