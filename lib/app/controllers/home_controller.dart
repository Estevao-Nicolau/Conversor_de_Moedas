import 'package:flutter/material.dart';

import 'package:conversor_de_moedas/app/models/currency_model.dart';

class HomeController {
  late List<CurrencyModel> currencies;
  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel tosCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    tosCurrency = currencies[0];
    fromCurrency = currencies[1];
  }
  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;

    if (fromCurrency.name == 'Real') {
      returnValue = value * tosCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      returnValue = value * tosCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      returnValue = value * tosCurrency.euro;
    } else if (fromCurrency.name == 'Bitcoin') {
      returnValue = value * tosCurrency.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
