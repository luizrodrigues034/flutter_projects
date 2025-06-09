import 'package:flutter/material.dart';
import 'package:imc_calc/input_page.dart';
import 'package:imc_calc/result_page.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        'result': (context) => ResultPage(),
      },
    ),
  );
}
