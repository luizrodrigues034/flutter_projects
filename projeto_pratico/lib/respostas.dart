import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String respostasTexto;
  final void Function() respostasFn;

  const Respostas(this.respostasTexto, this.respostasFn, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: respostasFn,
        child: Text(
          respostasTexto,
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 196, 1),
        ),
      ),
    );
  }
}
