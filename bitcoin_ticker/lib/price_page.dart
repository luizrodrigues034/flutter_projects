import 'package:bitcoin_ticker/card_coin.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/service_coin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PricePage extends StatefulWidget {
  final price;
  const PricePage(this.price, {super.key});

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  double? precoLTC;
  String _moedaSelecionada = currenciesList[0];
  CoinService service = CoinService();
  @override
  initState() {
    super.initState();
    precoLTC = widget.price;
  }

  setCoinCountry(String novoValor) {
    setState(() {
      _moedaSelecionada = novoValor;
      service.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coin Ticker')),
      body: precoLTC == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: cryptoList
                        .map(
                          (moeda) => CardCoin(
                            '1 $moeda',
                            precoLTC!,
                            '$_moedaSelecionada',
                          ),
                        )
                        .toList(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    child: Center(
                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (selectedIndex) {
                          setCoinCountry(currenciesList[selectedIndex]);
                        },
                        children: currenciesList.map((String value) {
                          return Text(value);
                        }).toList(),
                      ),
                    ),
                    //child:
                  ),
                ),
              ],
            ),
    );
  }
}
//  child: DropdownMenu<String>(
//                         dropdownMenuEntries: currenciesList.map((String opcao) {
//                           return DropdownMenuEntry(value: opcao, label: opcao);
//                         }).toList(),
//                         onSelected: (String? novoValor) {
//                           if (novoValor != null) {
//                             setCoinCountry(novoValor);
//                           }
//                         },
//                         initialSelection: currenciesList[0],
//                         label: Text('Moeda'),
//                         enableSearch: true,
//                         menuHeight: 200,
//                       )