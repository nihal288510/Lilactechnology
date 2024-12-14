import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lilacapp/Screens/loginScreen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    });
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Vector (1).png',
            height: 200,
            width: 200,
          ),
        ],
      ),
    ));
  }
}
