import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());


class PerguntaAppState extends State<PerguntaApp>{
  var perguntaSelecionada = 0;

  void responder(){
      setState(() {
        perguntaSelecionada++;
      });
      print("Pergunta foi respondida $perguntaSelecionada");
    }


  @override
  Widget build(BuildContext context)
  {
    final perguntas = ['Qual o seu time?', 'Qual sua cor favorita'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 78, 81, 255),
          title: Text(
            "Ola mundo",
          ),     
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[perguntaSelecionada]),
            ElevatedButton(
              child: Text("Botafogo"),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text("Vasco"),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text("Fluminense"),
              onPressed: responder,
            ),
          ],
        ),
      )
    );
  
  }
}



class PerguntaApp extends StatefulWidget{
  const PerguntaApp({super.key});
  @override
  PerguntaAppState createState(){
    return PerguntaAppState();
  }
}