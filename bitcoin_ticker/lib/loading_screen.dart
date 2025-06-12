import 'package:bitcoin_ticker/price_page.dart';
import 'package:bitcoin_ticker/service_coin.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  CoinService service = CoinService();

  @override
  initState() {
    super.initState();
    getPreco();
  }

  Future<void> getPreco() async {
    await service.getData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PricePage(service.priceCoin)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
