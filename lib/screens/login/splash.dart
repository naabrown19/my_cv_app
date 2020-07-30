import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.cover,
              )),
          Align(
              alignment: FractionalOffset.topCenter,
              child: Image.asset(
                'assets/logos/logo-bn.png',
                width: 200,
              )),
        ],
      ),
    );
  }
}
