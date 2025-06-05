import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double value) OnSubmit;
  TransactionForm(this.OnSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final textController = TextEditingController();

  final valorController = TextEditingController();

  _submitForm() {
    final titulo = textController.text;
    final valor = double.tryParse(valorController.text) ?? 0.0;

    if (titulo.isEmpty || valor.isNaN || valor.isNegative || valor == 0.0) {
      print('Valores invalidos');
      return;
    }
    widget.OnSubmit(titulo, valor);
  }

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
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(labelText: "Titulo"),
            ),
            TextField(
              controller: valorController,
              onSubmitted: (_) => _submitForm,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: "Valor (R\$)"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submitForm,

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
