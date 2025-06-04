import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:xylophone/components/bota_musica.dart';

void main() {
  runApp(MaterialApp(home: XylophoneApp()));
}

class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BotaoMusica(1, Colors.red),
            BotaoMusica(2, Colors.orange),
            BotaoMusica(3, Colors.yellow),
            BotaoMusica(4, Colors.green),
            BotaoMusica(5, Colors.teal),
            BotaoMusica(6, Colors.blue),
            BotaoMusica(7, Colors.purple),
          ],
        ),
      ),
    );
  }
}
