import 'package:flutter/material.dart';
import './respostas.dart';

void main() {
  runApp(const PrimeiroApp());
}

class PrimeiroApp extends StatefulWidget {
  const PrimeiroApp({super.key});

  @override
  _PrimeiroAppPraState createState() {
    return _PrimeiroAppPraState();
  }
}

class _PrimeiroAppPraState extends State<PrimeiroApp> {
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Maria', 'pontuacao': 5},
        {'texto': 'João', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 1},
      ],
    },
  ];

  int perguntasRespondidas = 0;
  void respondidas() {
    setState(() {
      perguntasRespondidas++;
    });
  }

  bool get temPerguntaDisponivel {
    return perguntasRespondidas < _perguntas.length;
  }

  void reniciar() {
    setState(() {
      perguntasRespondidas = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaDisponivel
        ? _perguntas[perguntasRespondidas]['respostas']
              as List<Map<String, Object>>
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quiz")),
        body: temPerguntaDisponivel
            ? Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Text(
                      _perguntas[perguntasRespondidas]['texto'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  ...respostas.map((resp) {
                    return Respostas(resp['texto'] as String, respondidas);
                  }),
                ],
              )
            : Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      "Parabens Voce completou",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: reniciar,
                      child: Text("Voltar", style: TextStyle(fontSize: 30)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
