import 'package:conversor_de_moedas/app/components/currency_box.dart';
import 'package:conversor_de_moedas/app/controllers/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;
  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 100, left: 20, bottom: 20, right: 20),
        child: Column(
          children: [
            Image.network(
              'https://cdn.pixabay.com/photo/2017/07/20/13/32/scale-2522379_960_720.png',
              width: 300,
              height: 200,
            ),
            const SizedBox(height: 10),
            CurrencyBox(
              selectedItem: homeController.tosCurrency,
              controller: toText,
              items: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.tosCurrency = model!;
                });
              },
            ),
            const SizedBox(height: 10),
            CurrencyBox(
              selectedItem: homeController.fromCurrency,
              controller: fromText,
              items: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.fromCurrency = model!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                homeController.convert();
              },
              child: Text("Converter"),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.orange,
                onSurface: Colors.grey,
                elevation: 20,
                minimumSize: Size(150, 50),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
