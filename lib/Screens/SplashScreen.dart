import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('asset/lottie/SplashScreenAnimation.json'),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
