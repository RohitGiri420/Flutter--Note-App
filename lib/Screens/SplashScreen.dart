import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String? Email;
  String? Password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
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

  getData() async{
    SharedPreferences preffs = await SharedPreferences.getInstance();
    Email = await preffs.getString("Email");
    Password = await preffs.getString("Password");
  }
}
