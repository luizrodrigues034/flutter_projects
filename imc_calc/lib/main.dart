import 'package:flutter/material.dart';
import 'package:imc_calc/input_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0C101F),
          elevation: 1,
        ),
        scaffoldBackgroundColor: Color(0xFF0C101F),
      ),
      home: CardGender(),
    ),
  );
}

class CardGender extends StatefulWidget {
  const CardGender({super.key});
  @override
  State<CardGender> createState() => _CardGenderState();
}

class _CardGenderState extends State<CardGender> {
  Color selecionadoMan = Color.fromARGB(255, 18, 24, 42);
  Color selecionadoWoman = Color.fromARGB(255, 18, 24, 42);
  selectGender(int gender) {
    if (gender == 1) {
      setState(() {
        selecionadoWoman = const Color.fromARGB(255, 27, 27, 27);
        selecionadoMan = Color.fromARGB(255, 18, 24, 42);
      });
    } else {
      setState(() {
        selecionadoMan = const Color.fromARGB(255, 27, 27, 27);
        selecionadoWoman = Color.fromARGB(255, 18, 24, 42);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Imc Calc')),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: selecionadoMan,
                child: InkWell(
                  onTap: () => selectGender(0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.male, semanticLabel: 'Male', size: 100),
                        Text('MALE'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: selecionadoWoman,
                child: InkWell(
                  onTap: () => selectGender(1),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.female, semanticLabel: 'Male', size: 100),
                        Text('FEMALE'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
