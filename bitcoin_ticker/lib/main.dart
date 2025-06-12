import 'dart:convert';

import 'package:bitcoin_ticker/loading_screen.dart';
import 'package:flutter/material.dart';

//LFKKGb1LACGNlpSCOZhW0A==ZTJIKQrQ9m6WNxl7
void main() {
  runApp(CriptoApp());
}

class CriptoApp extends StatefulWidget {
  const CriptoApp({super.key});

  @override
  State<CriptoApp> createState() => _CriptoAppState();
}

class _CriptoAppState extends State<CriptoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Color(0Xff5CC2FF)),
        scaffoldBackgroundColor: ThemeData.light().scaffoldBackgroundColor,
      ),
      home: LoadingScreen(),
    );
  }
}
