import 'package:flutter/material.dart';

void main() {
  runApp(QuizzApp());
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({super.key});

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  List<Map<String, Object>> perguntas = [
    {'pergunta': 'Vai chover hoje', 'resposta': false},
    {'pergunta': 'O ceu e azul', 'resposta': true},
    {'pergunta': 'A terra e plana', 'resposta': false},
    {'pergunta': 'Matue canta pop', 'resposta': true},
    {'pergunta': 'Gorila eh um tipo de cavalo', 'resposta': false},
    {'pergunta': 'Botafogo nao foi campeao', 'resposta': false},
    {'pergunta': 'A terra e redonda', 'resposta': true},
  ];

  int perguntaSelecionada = 0;
  List<Icon> scoreKeeper = [];

  respondePergunta(bool valor) {
    setState(() {
      if (perguntas[perguntaSelecionada]['resposta'] as bool == valor) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.cancel, color: Colors.red));
      }
      perguntaSelecionada++;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 25, 25, 25),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: perguntas.length > perguntaSelecionada
                  ? botoes
                  : [
                      Center(
                        child: Text(
                          "Obrigado por jogoar",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                scoreKeeper.clear();
                                perguntaSelecionada = 0;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              backgroundColor: const Color.fromARGB(
                                255,
                                34,
                                89,
                                255,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: Text(
                              "Voltar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> get botoes {
    if (perguntaSelecionada >= perguntas.length) {
      return [];
    }
    return [
      Flexible(
        fit: FlexFit.loose,
        child: Center(
          child: Text(
            perguntas[perguntaSelecionada]['pergunta'] as String,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      Flexible(
        fit: FlexFit.loose,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => respondePergunta(true),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Colors.green,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Text(
                "True",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ),
      ),

      Flexible(
        fit: FlexFit.loose,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => respondePergunta(false),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
                backgroundColor: const Color.fromARGB(255, 255, 34, 34),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Text(
                "False",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ),
      ),
      Row(children: scoreKeeper),
    ];
  }
}
