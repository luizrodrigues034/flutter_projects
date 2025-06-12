import 'dart:convert';

import 'package:http/http.dart' as htpp;

const coinWebUrl = 'https://api.api-ninjas.com/v1/cryptoprice?symbol=LTCBTC';
const headers = {"X-Api-Key": "LFKKGb1LACGNlpSCOZhW0A==ZTJIKQrQ9m6WNxl7"};

class CoinService {
  late double priceCoin;

  getData() async {
    var request = await htpp.get(Uri.parse(coinWebUrl), headers: headers);
    if (request.statusCode == 200) {
      final requisicao = jsonDecode(request.body);
      priceCoin = double.parse(requisicao['price']);
      print('nova requissicao');
    } else {
      return throw 'Erro ao realizar a conxecao';
    }
  }
}
