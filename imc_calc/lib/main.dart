import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0C101F),
          elevation: 2,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 29),
        ),
        textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: Color(0xFF0C101F),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      home: InputPage(),
    ),
  );
}

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
      body: Center(
        child: Text('Ola', style: Theme.of(context).textTheme.bodyLarge),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
