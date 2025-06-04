import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class BotaoMusica extends StatelessWidget {
  final int numAudio;
  final Color cor;
  const BotaoMusica(this.numAudio, this.cor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: cor,
        child: TextButton(
          onPressed: () {
            final player = AudioPlayer();
            player.play(AssetSource('audio/note$numAudio.wav'));
          },
          child: Text(''),
        ),
      ),
    );
  }
}
