import 'package:expenses/Models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transacoes;
  const TransactionList(this.transacoes, {super.key});

  @override
  Widget build(BuildContext context) {
    return transacoes.isEmpty
        ? Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Nenhuma gasto encontrado!",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : Container(
            height: 300,
            child: ListView.builder(
              itemCount: transacoes.length,
              itemBuilder: (ctx, index) {
                final cont = transacoes[index];
                return Column(
                  children: <Widget>[
                    Card(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.purple,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Text(
                              'R\$ ${cont.valor.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                cont.title,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                DateFormat('d MMM y').format(cont.date),
                                style: TextStyle(
                                  color: Color.fromARGB(255, 110, 110, 110),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
  }
}
