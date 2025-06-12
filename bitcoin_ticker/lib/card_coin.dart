import 'package:flutter/material.dart';

const kTextStyle = TextStyle(color: Colors.white, fontSize: 20);

class CardCoin extends StatelessWidget {
  double cryptoValue;
  String nameCoin;
  String moeda;

  CardCoin(this.nameCoin, this.cryptoValue, this.moeda, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 3,
        color: Color(0Xff5CC2FF),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$nameCoin = ', style: kTextStyle),
              Text('$cryptoValue $moeda', style: kTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
