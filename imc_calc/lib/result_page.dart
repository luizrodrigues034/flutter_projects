import 'package:flutter/material.dart';
import 'package:imc_calc/constanst.dart';
import 'package:imc_calc/dto_imc_data.dart';
import 'package:imc_calc/input_page.dart';
import 'package:imc_calc/reusable_card.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DtoImcData;
    Gender gender = args.gender;
    final int age = args.age;
    final int heigth = args.heigth;
    final int weight = args.weight;
    final double resultado = (weight / heigth * heigth);
    String classificateBmi(double resultado) {
      if (resultado < 18.5) return 'Abaixo do peso';
      if (resultado < 25) return 'Peso normal';
      if (resultado < 30) return 'Sobrepeso';
      if (resultado < 35) return 'Obesidade grau I';
      if (resultado < 40) return 'Obesidade grau II';
      return 'Obesidade grau III';
    }

    return Scaffold(
      appBar: AppBar(title: Text('Resultado')),
      body: Row(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: double.infinity,
                height: 400,
                child: ReusableCard(
                  selectColor: kBottomContainerColour,
                  chieldContent: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Resultado:',
                        style: kNumberStyle.copyWith(fontSize: 28),
                      ),
                      Text(resultado.toInt().toString(), style: kNumberStyle),
                      Text(
                        'SEU IMC E CLASSIFICADO COMO:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${classificateBmi(resultado)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
