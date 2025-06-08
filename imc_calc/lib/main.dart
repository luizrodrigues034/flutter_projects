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
  @override
  Widget build(BuildContext context) {
    return InputPage();
  }
}
