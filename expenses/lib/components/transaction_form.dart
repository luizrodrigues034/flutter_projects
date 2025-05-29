import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final textController = TextEditingController();
  final valorController = TextEditingController();

  TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(labelText: "Titulo"),
            ),
            TextField(
              controller: valorController,
              decoration: InputDecoration(labelText: "Valor (R\$)"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => {
                    print('${textController.text} ${valorController.text}'),
                  },

                  style: TextButton.styleFrom(foregroundColor: Colors.purple),
                  child: Text("Nova Transacao"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
