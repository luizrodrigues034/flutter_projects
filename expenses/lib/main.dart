import 'dart:math';

import 'package:expenses/Models/transaction.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ExpensessApp());
}

class ExpensessApp extends StatelessWidget {
  const ExpensessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transacoes = [
    Transaction(id: 't1', title: "Titulo1", valor: 100.0, date: DateTime.now()),
    Transaction(id: 't2', title: "Titulo2", valor: 50, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      valor: value,
      date: DateTime.now(),
    );
    setState(() {
      _transacoes.add(newTransaction);
    });
  }

  _showFormInput(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Despesas Pessoais",
            style: TextStyle(color: Colors.white),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Card(
                  color: Colors.blue,
                  elevation: 5,
                  child: Text("Grafico"),
                ),
              ),

              TransactionList(_transacoes),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _showFormInput(context),
        ),
      ),
    );
  }
}
