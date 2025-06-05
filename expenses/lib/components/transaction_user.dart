import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/material.dart';
import '../Models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        TransactionList(_transacoes),
      ],
    );
  }
}
