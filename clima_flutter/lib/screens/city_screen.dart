import 'package:clima_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  TextEditingController _controller = TextEditingController();

  void setLocByCity() {
    var cityName = _controller.text;
  }

  final List<String> _estadosBrasileiros = [
    'Acre',
    'Alagoas',
    'Mato Grosso do Sul',
    'Mato Grosso',
    'Amapá',
    'Amazonas',
    'Bahia',
    'Ceará',
    'Distrito Federal',
    'Espírito Santo',
    'Goiás',
    'Maranhão',
    'Minas Gerais',
    'Pará',
    'Paraíba',
    'Paraná',
    'Pernambuco',
    'Piauí',
    'Rio de Janeiro',
    'Rio Grande do Norte',
    'Rio Grande do Sul',
    'Rondônia',
    'Roraima',
    'Santa Catarina',
    'São Paulo',
    'Sergipe',
    'Tocantins',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, size: 50.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) async {
                    if (textEditingValue.text.isEmpty) {
                      return Iterable<String>.empty();
                    }
                    ;

                    return _estadosBrasileiros.where((String option) {
                      return option.toLowerCase().contains(
                        (textEditingValue.text.toLowerCase()),
                      );
                    });
                  },
                  fieldViewBuilder:
                      (
                        BuildContext context,
                        TextEditingController textEditingController,
                        FocusNode focusNode,
                        VoidCallback onFielSubmitted,
                      ) {
                        return TextField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          onSubmitted: (String value) {
                            onFielSubmitted();
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: kInputDecoration,
                        );
                      },
                  //     },
                  // optionsViewBuilder:
                  //     (
                  //       BuildContext context,
                  //       AutocompleteOnSelected<String> onSelected,
                  //       Iterable<String> options,
                  //     ) {
                  //       return Align(alignment: Alignment.center, child: Material(elevation: 4, borderRadius: BorderRadius.circular(8.0),child: ListView.builder(padding:),),);
                  //     },
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Get Weather', style: kButtonTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
