import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'app/views/home_view.dart';

main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200, bottom: 150),
        child: Column(
          children: [
            Lottie.network(
                'https://assets4.lottiefiles.com/private_files/lf30_szgzjety.json'),
            Center(
              child: ElevatedButton(
                child: Text("Inicial"),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.orange,
                  onSurface: Colors.grey,
                  elevation: 20,
                  minimumSize: Size(150, 50),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeView()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
