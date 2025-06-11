import 'dart:convert';

import 'package:http/http.dart' as http;

class NetWorkHelper {
  String ulr;
  late int condition;
  late double temperature;
  late String cityName;

  NetWorkHelper(this.ulr);

  Future<Map<String, dynamic>> getData() async {
    http.Response response = await http.get(Uri.parse(ulr));
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeResponse = jsonDecode(response.body);
      print('Dados recebidos da Api');
      return decodeResponse;
    } else {
      print(response.statusCode);
      return throw 'Erro ao extrair dados da api';
    }
  }
}
